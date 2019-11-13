/*
 * Adapted from Exercise A.1.11 on page 236 of
 * Software Abstractions, by Daniel Jackson
 *
 * In this exercise, you'll write some constraints about a simplified version
 * of the railway lines of the London Underground, or "tube". (You can find the
 * real thing at http://tube.tfl.gov.uk/.) There are three lines shown: the
 * Jubilee line running north to south from Stanmore; the Central line running
 * west to east to Epping; and the Circle line running clockwise through Baker
 * Street.
 *
 * A simplified portion of the tube is shown below
 *
 *               Stanmore
 *             x
 *             |
 *             | Baker Street
 *           - x -
 *         /   |   \
 *        /    |    \
 *       |     |     |         Epping
 *  -----------------|-------x
 *       |     |     |
 *        \    |    /
 *         \   |   /
 *           -----
 *             |
 *             |
 *
 * You are given the following relations:
 *
 *  - Station:
 *    the set of all stations
 *
 *  - JubileeStation, CentralStation, CircleStation:
 *    for each line, a subset of Station
 *
 *  - jubliee, central, circle:
 *    binary relations relating stations on each line to one another if they
 *    are directly connected
 *
 *  - Stanmore, BakerStreet, Epping
 *    singleton subsets of Station for individual stations
 *
 * Formalize each of the following statements using the Alloy logic in the
 * model as indicated below.
 *   a) named stations are on exactly the lines as shown in graphic
 *   b) no station (including those unnamed) is on all three lines
 *   c) the Circle line forms a circle
 *   d) Jubilee is a straight line starting at Stanmore
 *   e) there's a station between Stanmore and BakerStreet
 *   f) it is possible to travel from BakerStreet to Epping
 */

sig Station {}

sig JubileeStation in Station {
  jubilee: set JubileeStation
}

sig CentralStation in Station {
  central: set CentralStation
}

sig CircleStation in Station {
  circle: set CircleStation
}

one sig Stanmore, BakerStreet, Epping extends Station {}

fact {
  // write the corresponding constraint below each statement

  // a) named stations are on exactly the lines as shown in graphic

  // b) no station (including those unnamed) is on all three lines

  // c) the Circle line forms a circle

  // d) Jubilee is a straight line starting at Stanmore

  // e) there's a station between Stanmore and BakerStreet

  // f) it is possible to travel from BakerStreet to Epping
}

pred show {}
run show for 6
