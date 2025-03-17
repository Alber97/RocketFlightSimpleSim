#include <stdio.h>
#include <unistd.h>
#include <math.h>
#include <stdint.h>

#define clear() printf("\033[H\033[J")
#define STANDARD_GRAVITY 9.81
#define PI 3.1415

struct rocketType 
{
	double rocketMass;
	double yPos;
	double maxThrust;
	double yVel;
	double yAcc;
};

struct rocketType returnNewRocket(double rM, double mT, double yPosInit)
{
	struct rocketType tempRocket;
	tempRocket.rocketMass = rM;
	tempRocket.yPos = yPosInit;
	tempRocket.yVel = 0;
	tempRocket.yAcc = 0;
	tempRocket.maxThrust = mT;

	return tempRocket;
}

struct controlPID
{
	double proportionalGain;
	double integralGain;
	double derivativeGain;
};

struct controlPID returnPIDController(double kP, double kI, double kD)
{
	struct controlPID tempPIDController;
	tempPIDController.proportionalGain = kP;
	tempPIDController.integralGain = kI;
	tempPIDController.derivativeGain = kD;

	return tempPIDController;
} 

double calculateCS(double error, double prevE, double *sum, double T, struct controlPID tempPID, double maxT, int iter, uint8_t controlType)
{
	double controlSignal;
	double slidingVariable;
	double discontinuousControl;

	if (controlType == 1)
	{
		*sum += error;
		controlSignal = (tempPID.proportionalGain * error + tempPID.derivativeGain * (error - prevE)/T + *sum * T * tempPID.integralGain);
		controlSignal += STANDARD_GRAVITY; //feed forward
		if (controlSignal > maxT)
		{
			controlSignal = maxT;
		}
		if (controlSignal - STANDARD_GRAVITY <= 0)
		{
			//controlSignal = 0.0;
		}

		if (iter == 0)
		{
			printf("P: %f, D: %f, I: %f.\n", tempPID.proportionalGain * error, tempPID.derivativeGain * (error - prevE)/T, *sum * T * tempPID.integralGain);
			//printf("Error diff: %f.\n", error - prevE);
		}
	}

	else
	{
		// tempPID.proportionalGain -> sliding line slope coefficient
		// tempPID.integralGain -> sliding mode control final gain
		// tempPID.derivativeGain -> linear reaching law gain

		slidingVariable = error * tempPID.proportionalGain + (error - prevE)/T;

		discontinuousControl = slidingVariable;

		if (discontinuousControl > 0)
			discontinuousControl = 1;
		else if (discontinuousControl < 0)
			discontinuousControl = -1;
		else
			discontinuousControl = 0;

		discontinuousControl *= tempPID.integralGain;

		controlSignal = discontinuousControl + slidingVariable * tempPID.derivativeGain;

		controlSignal += STANDARD_GRAVITY; //feed forward

		if (controlSignal > maxT)
		{
			controlSignal = maxT;
		}
		if (iter == 0)
		{
			printf("uD: %f, uRL: %f.\n", discontinuousControl, slidingVariable * tempPID.derivativeGain);
		}
	}
	return controlSignal;
}

double generateWind(int n, int A)
{
	double signal;
	double t = (double)n * 2 * PI;
	signal = A * sin(t);

	return signal;
}

double performSimulation(double time, double step, double dAltitude, struct controlPID PID, struct rocketType rocket, uint8_t regType)
{
	double tempT = 0.0;
	int stepCounter = 0.0;
	double prevVel = 0.0;
	double prevAcc = 0.0;
	double prevPos = 0.0;

	double errorSum = 0.0;
	double prevError = 0.0;
	double prevErrorVel = 0.0;
	double errorSumVel = 0.0;

	double cS;
	double csVel;

	double setTime = 1000;

	double dragForce;

	uint8_t setTimeMeasd = 0;

	struct controlPID VelPID;
	VelPID = returnPIDController(0.1, 0.00, 1.0);

	prevPos = rocket.yPos;

	while (tempT <= time)
	{
		dragForce = prevVel * prevVel * 0.01;

		if (prevVel < 0)
			dragForce = -dragForce;

		if (dragForce >= cS)
		{
			dragForce = cS;
		}

		rocket.yAcc = (cS - dragForce - generateWind(stepCounter, 3.0))/rocket.rocketMass - STANDARD_GRAVITY;
		rocket.yVel = prevVel + rocket.yAcc * step;
		rocket.yPos = prevPos + prevVel * step;
		//update: calculation corrected

		cS = calculateCS(dAltitude - rocket.yPos, prevError, &errorSum, step, PID, rocket.maxThrust, stepCounter, regType);
		//csVel = calculateCS(dAltitude - rocket.yPos, prevErrorVel, &errorSumVel, step, VelPID, rocket.maxThrust);  

		if (rocket.yPos <= 0)
		{
			rocket.yPos = 0.0;
	
			if (rocket.yVel < 0)
			{
				rocket.yVel = 0.0;
			}
		}

		//usleep(step * 1000000);
		stepCounter += 1;

		if (stepCounter == 100000)
		{
			stepCounter = 0;
			//clear();
			printf("Rocket acceleration: %f, rocket velocity: %f.", rocket.yAcc, rocket.yVel);
			printf("Time: %f, rocket position: %f, position error: %f, control: %f.\n\n", tempT, rocket.yPos, dAltitude - rocket.yPos, cS);
		}

		tempT += step;

		prevPos = rocket.yPos;
		prevVel = rocket.yVel;
		prevAcc = rocket.yAcc;
		prevErrorVel = 20.0 - cS;

		prevError = dAltitude - rocket.yPos;

		if ((prevError < 2) && (setTimeMeasd == 0))
		{
			setTime = tempT;
			setTimeMeasd = 1;
		}
	}

	return setTime;
}

int main(int* arg, char** argc)
{
	struct rocketType newRocket;
	newRocket = returnNewRocket(1.0, 20.0, 0.0);

	struct controlPID newPID;
	newPID = returnPIDController(0.01, 0.000001, 0.15);

	struct controlPID newSMC;
	newSMC = returnPIDController(0.5, 1.0, 0.02);

	double simTime = 120.0;
	double simStep = 0.000001; //1 us

	double finalTime;

	//finalTime = performSimulation(simTime, simStep, 1000.0, newPID, newRocket, 1);
	finalTime = performSimulation(simTime, simStep, 1000.0, newSMC, newRocket, 0);

	printf("\n\n Settling time: %f\n\n", finalTime);

	return 0;
}
