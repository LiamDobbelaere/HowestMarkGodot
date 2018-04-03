using Godot;
using System;

public class ZylannMicroHM : Node
{
	private const int ITERATIONS = 2000000;
    private const float AVG_TIMES = 10.0f;

    private Chronometer chronometer = new Chronometer();
    private long whileTime;

    /* Stuff used for tests { */
    private int memberVar = 1;

    void EmptyVoidFunction()
    {

    }
    /* } Stuff used for tests */

    // Use this for initialization
    public override void _Ready() {
        float vtest_while_loop = 0;
        float vtest_empty_func = 0;
        float vtest_increment = 0;
        float vtest_increment_x5 = 0;
        float vtest_increment_with_member_var = 0;
        float vtest_increment_with_local_outside_loop = 0;
        float vtest_increment_with_local_inside_loop = 0;
        float vtest_increment_vector2 = 0;
        float vtest_increment_vector3 = 0;
        float vtest_increment_vector3_constant = 0;
        float vtest_increment_vector3_individual_xyz = 0;
        float vtest_unused_local = 0;
        float vtest_divide = 0;
        float vtest_increment_with_array_member = 0;
        float vtest_if_true = 0;
        float vtest_if_true_else = 0;

        var avg_count = 0;
        while (avg_count < AVG_TIMES) {
            vtest_while_loop += test_while_loop();
            vtest_empty_func += test_empty_func();
            vtest_increment += test_increment();
            vtest_increment_x5 += test_increment_x5();
            vtest_increment_with_member_var += test_increment_with_member_var();
            vtest_increment_with_local_outside_loop += test_increment_with_local_outside_loop();
            vtest_increment_with_local_inside_loop += test_increment_with_local_inside_loop();
            vtest_increment_vector2 += test_increment_vector2();
            vtest_increment_vector3 += test_increment_vector3();
            vtest_increment_vector3_constant += test_increment_vector3_constant();
            vtest_increment_vector3_individual_xyz += test_increment_vector3_individual_xyz();
            vtest_unused_local += test_unused_local();
            vtest_divide += test_divide();
            vtest_increment_with_array_member += test_increment_with_array_member();
            vtest_if_true += test_if_true();
            vtest_if_true_else += test_if_true_else();
            avg_count += 1;
        }

        vtest_while_loop /= AVG_TIMES;
        vtest_empty_func /= AVG_TIMES;
        vtest_increment /= AVG_TIMES;
        vtest_increment_x5 /= AVG_TIMES;
        vtest_increment_with_member_var /= AVG_TIMES;
        vtest_increment_with_local_outside_loop /= AVG_TIMES;
        vtest_increment_with_local_inside_loop /= AVG_TIMES;
        vtest_increment_vector2 /= AVG_TIMES;
        vtest_increment_vector3 /= AVG_TIMES;
        vtest_increment_vector3_constant /= AVG_TIMES;
        vtest_increment_vector3_individual_xyz /= AVG_TIMES;
        vtest_unused_local /= AVG_TIMES;
        vtest_divide /= AVG_TIMES;
        vtest_increment_with_array_member /= AVG_TIMES;
        vtest_if_true /= AVG_TIMES;
        vtest_if_true_else /= AVG_TIMES;

        GD.Print(string.Format("bench test_while_loop, {0}\r", vtest_while_loop));
        GD.Print(string.Format("bench test_empty_func, {0}\r", vtest_empty_func));
        GD.Print(string.Format("bench test_increment, {0}\r", vtest_increment));
        GD.Print(string.Format("bench test_increment_x5, {0}\r", vtest_increment_x5));
        GD.Print(string.Format("bench test_increment_with_member_var, {0}\r", vtest_increment_with_member_var));
        GD.Print(string.Format("bench test_increment_with_local_outside_loop, {0}\r", vtest_increment_with_local_outside_loop));
        GD.Print(string.Format("bench test_increment_with_local_inside_loop, {0}\r", vtest_increment_with_local_inside_loop));
        GD.Print(string.Format("bench test_increment_vector2, {0}\r", vtest_increment_vector2));
        GD.Print(string.Format("bench test_increment_vector3, {0}\r", vtest_increment_vector3));
        GD.Print(string.Format("bench test_increment_vector3_constant, {0}\r", vtest_increment_vector3_constant));
        GD.Print(string.Format("bench test_increment_vector3_individual_xyz, {0}\r", vtest_increment_vector3_individual_xyz));
        GD.Print(string.Format("bench test_unused_local, {0}\r", vtest_unused_local));
        GD.Print(string.Format("bench test_divide, {0}\r", vtest_divide));
        GD.Print(string.Format("bench test_increment_with_array_member, {0}\r", vtest_increment_with_array_member));
        GD.Print(string.Format("bench test_if_true, {0}\r", vtest_if_true));
        GD.Print(string.Format("bench test_if_true_else, {0}\r", vtest_if_true_else));
		
		GetTree().Quit();
    }

    //-------------------------------------------------------------------------------
    private long test_while_loop()
    {
        chronometer.Start();

        var i = 0;
        while (i < ITERATIONS)
        {
            i += 1;
        }

        whileTime = chronometer.Stop();

        return whileTime;
    }
    //-------------------------------------------------------------------------------
    private long test_empty_func () {
        chronometer.Start();

        var i = 0;
        while (i < ITERATIONS)
        {
            EmptyVoidFunction();
            i += 1;
        }

        return chronometer.Stop() - whileTime;
    }
    //-------------------------------------------------------------------------------
    private long test_increment()
    {
        var a = 0;

        chronometer.Start();

        var i = 0;
        while (i < ITERATIONS) {
            a += 1;
            i += 1;
        }

        return chronometer.Stop() - whileTime;
    }


    //-------------------------------------------------------------------------------
    private long test_increment_x5()
    {
        var a = 0;

        chronometer.Start();

        var i = 0;
        while (i < ITERATIONS)
        {
            a += 1;
            a += 1;
            a += 1;
            a += 1;
            a += 1;
            i += 1;
        }

        return chronometer.Stop() - whileTime;
    }

    //-------------------------------------------------------------------------------
    private long test_increment_with_member_var()
    {
        var a = 0;

        chronometer.Start();

        var i = 0;
        while (i < ITERATIONS) {
            a += memberVar;
            i += 1;
        }

        return chronometer.Stop() - whileTime;
    }

    //-------------------------------------------------------------------------------
    private long test_increment_with_local_outside_loop()
    {
        var a = 0;
        var b = 1;

        chronometer.Start();

        var i = 0;
        while (i < ITERATIONS)
        {
            a += b;
            i += 1;
        }

        return chronometer.Stop() - whileTime;
    }

    //-------------------------------------------------------------------------------
    private long test_increment_with_local_inside_loop()
    {
        var a = 0;

        chronometer.Start();

        var i = 0;
        while (i < ITERATIONS)
        {
            var b = 1;
            a += b;
            i += 1;
        }

        return chronometer.Stop() - whileTime;
    }

    //-------------------------------------------------------------------------------
    private long test_increment_vector2()
    {
        var a = new Vector2(0, 0);
        var b = new Vector2(1, 1);

        chronometer.Start();

        var i = 0;
        while (i < ITERATIONS)
        {
            a += b;
            i += 1;
        }

        return chronometer.Stop() - whileTime;
    }

    //-------------------------------------------------------------------------------
    private long test_increment_vector3()
    {
        var a = new Vector3(0, 0, 0);
        var b = new Vector3(1, 1, 1);

        chronometer.Start();

        var i = 0;
        while (i < ITERATIONS)
        {
            a += b;
            i += 1;
        }

        return chronometer.Stop() - whileTime;
    }

    //-------------------------------------------------------------------------------
    private long test_increment_vector3_constant()
    {
        var a = new Vector3(0, 0, 0);

        chronometer.Start();

        var i = 0;
        while (i < ITERATIONS) {
            a += new Vector3(1, 1, 1);
            i += 1;
        }

        return chronometer.Stop() - whileTime;
    }

    //-------------------------------------------------------------------------------
    private long test_increment_vector3_individual_xyz()
    {
        var a = new Vector3(0, 0, 0);
        var b = new Vector3(1, 1, 1);

        chronometer.Start();

        var i = 0;
        while (i < ITERATIONS)
        {
            a.x += b.x;
            a.y += b.y;
            a.z += b.z;
            i += 1;
        }
        return chronometer.Stop() - whileTime;
    }

    //-------------------------------------------------------------------------------
    private long test_unused_local()
    {
        chronometer.Start();

        var i = 0;
        while (i < ITERATIONS)
        {
            var b = 1;
            i += 1;
        }

        return chronometer.Stop() - whileTime;
    }

    //-------------------------------------------------------------------------------
    private long test_divide()
    {
        chronometer.Start();

        var a = 9999.0;

        var i = 0;
        while (i < ITERATIONS)
        {
            a /= 1.01;
            i += 1;
        }

        return chronometer.Stop() - whileTime;
    }

    //-------------------------------------------------------------------------------
    private long test_increment_with_array_member()
    {
        chronometer.Start();
        var a = 0;
        int[] arr = { 1 };

        var i = 0;
        while (i < ITERATIONS)
        {
            a += arr[0];
            i += 1;
        }

        return chronometer.Stop() - whileTime;
    }

    //-------------------------------------------------------------------------------
    private long test_if_true()
    {
        chronometer.Start();
        var i = 0;
        while (i < ITERATIONS)
        {
            if (true)
            {

            }

            i += 1;
        }

        return chronometer.Stop() - whileTime;
    }

    //-------------------------------------------------------------------------------
    private long test_if_true_else()
    {
        chronometer.Start();
        var i = 0;
        while (i < ITERATIONS)
        {
            if (true)
            {

            }
            else
            {

            }

            i += 1;
        }

        return chronometer.Stop() - whileTime;
    }
}
