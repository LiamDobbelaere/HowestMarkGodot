using Godot;
using System;
using System.Diagnostics;

public class Chronometer
{
    private Stopwatch stopwatch;

    public Chronometer()
    {
        stopwatch = new Stopwatch();
    }

    public void Start()
    {
        stopwatch.Reset();
        stopwatch.Start();
    }

    public long Stop()
    {
        stopwatch.Stop();

        return stopwatch.ElapsedMilliseconds;// * 1000000 / Stopwatch.Frequency;
    }
}
