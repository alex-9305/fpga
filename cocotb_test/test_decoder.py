import cocotb
from cocotb.triggers import FallingEdge, Timer
from cocotb.clock import Clock


@cocotb.test()
async def test_for_error(dut):
    cocotb.start_soon(Clock(dut.clk, 1, units="ns").start())

    dut.in_bit = 0
    dut.n_reset = 0

    await Timer(5, units="ns")
    dut.n_reset = 1
    await Timer(5, units="ns")
    dut.in_bit = 1
    await Timer(1, units="ns")
    dut.in_bit = 0
    await Timer(2, units="ns")
    dut.in_bit = 1

    dut._log.info("error_state is %s", dut.error_state.value)
    assert dut.error_state.value == 1, "error_state is not 1!"