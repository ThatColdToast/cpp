#include "Timer.h"

Timer::Timer(const char* name)
    : m_Name(name), m_Stopped(false)
{
    m_StartTimepoint = std::chrono::high_resolution_clock::now();
}

void Timer::Stop()
{
    auto endTimepoint = std::chrono::high_resolution_clock::now();

    long long start = std::chrono::time_point_cast<std::chrono::microseconds>(m_StartTimepoint).time_since_epoch().count();
    long long end = std::chrono::time_point_cast<std::chrono::microseconds>(endTimepoint).time_since_epoch().count();

    auto us = end - start;
    double ms = us * 0.001;

    m_Stopped = true;

    if(us > 1000)
        std::cout << "Duration: " << ms << "ms" << std::endl;
    else
        std::cout << "Duration: " << us << "us" << std::endl;
}

Timer::~Timer()
{
    if(!m_Stopped)
        Stop();
}