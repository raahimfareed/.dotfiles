#include "stm32f4xx.h"

int main()
{
    SystemInit();

    // Enable GPOIA Clock
    RCC->AHB1ENR |= RCC_AHB1ENR_GPIOAEN;

    // Set PA5 as output
    GPIOA->MODER |= GPIO_MODER_MODE5_0;

    // Set output as push pull
    GPIOA->OTYPER &= ~GPIO_OTYPER_OT5;

    // Set output speed
    GPIOA->OSPEEDR |= GPIO_OSPEEDER_OSPEEDR5;

    while (true)
    {
        GPIOA->ODR ^= GPIO_ODR_OD5;

        // Delay
        for (volatile int i = 0; i < 1000000; ++i)
            ;
    }
}