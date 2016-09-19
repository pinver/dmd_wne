/**
 * Random number generators for internal usage.
 *
 * Copyright: Copyright Digital Mars 2014.
 * License:   $(WEB www.boost.org/LICENSE_1_0.txt, Boost License 1.0).
 */
module rt.util.random;

struct Rand48
{
nothrow:
    private ulong rng_state;

    void defaultSeed()
    {
        import ctime = core.stdc.time : time;
        seed(cast(uint)ctime.time(null));
    }

    void seed(uint seedval)
    {
        assert(seedval);
        rng_state = cast(ulong)seedval << 16 | 0x330e;
        popFront();
    }

    auto opCall() @nogc
    {
        auto result = front;
        popFront();
        return result;
    }

    @property uint front() @nogc
    {
        return cast(uint)(rng_state >> 16);
    }

    void popFront() @nogc
    {
        immutable ulong a = 25214903917;
        immutable ulong c = 11;
        immutable ulong m_mask = (1uL << 48uL) - 1;
        rng_state = (a*rng_state+c) & m_mask;
    }

    enum empty = false;
}
