#include "stm32f4xx.h"
#define LEDPORT (GPIOD)
#define LED1 (12)
#define ENABLE_GPIO_CLOCK (RCC->AHB1ENR |= RCC_AHB1ENR_GPIODEN)
#define _MODER MODER
#define GPIOMODER (GPIO_MODER_MODER12_0)
void ms_delay(int ms)
{
    while (ms-- > 0)
    {
        volatile int x = 500;
        while (x-- > 0)
            __asm("nop");
    }
}

// Alternates blue and green LEDs quickly
int main(void)
{
    ENABLE_GPIO_CLOCK;            // enable the clock to GPIO
    LEDPORT->_MODER |= GPIOMODER; // set pins to be general purpose output
    for (;;)
    {
        ms_delay(500);
        LEDPORT->ODR ^= (1 << LED1); // toggle diodes
    }

    return 0;
}