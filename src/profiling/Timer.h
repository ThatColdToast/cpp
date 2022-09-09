#pragma once

#include <chrono>
#include <iostream>

class Timer
{
public:
    Timer(const char* name);
    void Stop();
    ~Timer();
private:
    const char* m_Name;
    std::chrono::time_point<std::chrono::high_resolution_clock> m_StartTimepoint;
    bool m_Stopped;
};