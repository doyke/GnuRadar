// -*- verilog -*-
//
//  USRP - Universal Software Radio Peripheral
//
//  Copyright (C) 2006 Matt Ettus
//
//  This program is free software; you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation; either version 2 of the License, or
//  (at your option) any later version.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//
//  You should have received a copy of the GNU General Public License
//  along with this program; if not, write to the Free Software
//  Foundation, Inc., 51 Franklin Street, Boston, MA  02110-1301  USA
//

// ------------------------------------------------------------
// If TX_ON is not defined, there is *no* transmit circuitry built
// `define TX_ON

// ------------------------------------------------------------
// Define 1 and only one of TX_SINGLE, TX_DUAL and TX_QUAD
// to respectively enable 1, 2 or 4 transmit channels.
// [Please note that only TX_SINGLE and TX_DUAL are currently valid]
//`define TX_SINGLE
//`define TX_DUAL
//`define TX_QUAD

// ------------------------------------------------------------
// Define TX_HB_ON to enable the transmit halfband filter
// [Not implemented]
//`define TX_HB_ON

// ------------------------------------------------------------
// IF RX_ON is not defined, there is *no* receive circuitry built
`define RX_ON

// ------------------------------------------------------------
// Define 1 and only one of RX_SINGLE, RX_DUAL and RX_QUAD
// to respectively define 1, 2 or 4 receive channels.

//`define RX_SINGLE
`define RX_DUAL
//`define RX_QUAD

// ------------------------------------------------------------
// Define RX_HB_ON to enable the receive halfband filter
`define RX_HB_ON

// ------------------------------------------------------------
// Define RX_NCO_ON to enable the receive Numerical Controlled Osc
  `define RX_NCO_ON

// ------------------------------------------------------------
// Define RX_CIC_ON to enable the receive Cascaded Integrator Comb filter
  `define RX_CIC_ON

// ------------------------------------------------------------
// Define TTL-level (assuming you have 50-ohm termination) External Gate Enable
  `define EXT_GATE_ENABLE_ON

// ====================================================================
//	   This is the common tail for standard configuation
// ====================================================================
// 
//                  >>>> DO NOT EDIT BELOW HERE <<<<
//
// N.B., *all* the remainder of the code should be conditionalized
// only in terms of:
//
//  TX_ON, TX_EN_0, TX_EN_1, TX_EN_2, TX_EN_3, TX_CAP_NCHAN, TX_CAP_HB,
//  RX_ON, RX_EN_0, RX_EN_1, RX_EN_2, RX_EN_3, RX_CAP_NCHAN, RX_CAP_HB,
//  RX_NCO_ON, RX_CIC_ON
// ====================================================================

`ifdef TX_ON

 `ifdef TX_SINGLE
  `define TX_EN_0
  `define TX_CAP_NCHAN 3'd1
 `endif

 `ifdef TX_DUAL
  `define TX_EN_0
  `define TX_EN_1
  `define TX_CAP_NCHAN 3'd2
 `endif

 `ifdef TX_QUAD
  `define TX_EN_0
  `define TX_EN_1
  `define TX_EN_2
  `define TX_EN_3
  `define TX_CAP_NCHAN 3'd4
 `endif

 `ifdef TX_HB_ON
  `define TX_CAP_HB   1
 `else
  `define TX_CAP_HB   0
 `endif

`else	// !ifdef TX_ON

 `define TX_CAP_NCHAN 3'd0
 `define TX_CAP_HB 0

`endif // !ifdef TX_ON

// --------------------------------------------------------------------

`ifdef RX_ON

 `ifdef RX_SINGLE
  `define RX_EN_0
  `define RX_CAP_NCHAN 3'd1
 `endif

 `ifdef RX_DUAL
  `define RX_EN_0
  `define RX_EN_1
  `define RX_CAP_NCHAN 3'd2
 `endif

 `ifdef RX_QUAD
  `define RX_EN_0
  `define RX_EN_1
  `define RX_EN_2
  `define RX_EN_3
  `define RX_CAP_NCHAN 3'd4
 `endif

 `ifdef RX_HB_ON
  `define RX_CAP_HB   1
 `else
  `define RX_CAP_HB   0
 `endif

`else	// !ifdef RX_ON

 `define RX_CAP_NCHAN 3'd0
 `define RX_CAP_HB 0

`endif // !ifdef RX_ON
