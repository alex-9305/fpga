import cocotb
from cocotb.triggers import FallingEdge, Timer
from cocotb.clock import Clock

async def generate_clock(dut):
    """Generate clock pulses."""

    for cycle in range(50):
        dut.clk.value = 0
        await Timer(1, units="ns")
        dut.clk.value = 1
        await Timer(1, units="ns")

@cocotb.test()
async def test_for_error(dut):
    dut.in_bit.value = 0
    dut.n_reset.value = 0
    await cocotb.start(generate_clock(dut))  # run the clock "in the background"

    print(dut.in_bit.value)

    await Timer(5, units="ns")
    dut.n_reset.value = 1
    await Timer(5, units="ns")
    dut.in_bit.value = 1
    await Timer(1, units="ns")
    dut.in_bit.value = 0
    await Timer(2, units="ns")
    dut.in_bit.value = 1

    dut._log.info("error_state is %s", dut.error_state.value)
    assert dut.error_state.value == 1, "error_state is not 1!"