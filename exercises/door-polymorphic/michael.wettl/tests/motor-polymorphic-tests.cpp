#include <motor-mock.h>

#include <gtest/gtest.h>


TEST(motor_polymorphic_suite, base_conversion)
{
    Motor_Mock motor(Motor::Direction::IDLE);
    [[maybe_unused]] Motor* base = &motor;             // <-- derived converted to base
}

TEST(motor_polymorphic_suite, access_through_base)
{
    Motor_Mock motor(Motor::Direction::IDLE);
    Motor* base = &motor;
    ASSERT_EQ(base->get_direction(), Motor::Direction::IDLE);

    base->forward();                                   // <-- through base, derived's forward is called
    ASSERT_EQ(motor.get_direction(), Motor::Direction::FORWARD);
}
