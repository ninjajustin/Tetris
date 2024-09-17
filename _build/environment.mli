(** Types that are used within the program, e.g. for fields. *)
open Graphics

<<<<<<< HEAD
=======
open Board
open Unix

>>>>>>> 089b2d04536241f296ec085dfb1e24cceeec5ce2
type pixel_coord = int

type location = pixel_coord * pixel_coord

type piece = {
<<<<<<< HEAD
  piece_location : location;
=======
  mutable piece_location : location;
>>>>>>> 089b2d04536241f296ec085dfb1e24cceeec5ce2
  piece_shape : (pixel_coord * pixel_coord) array;
  piece_color : color;
}

type game_state = {
  current_piece : piece;
  score : int;
  gravity : int;
  upcoming_pieces : piece list;
<<<<<<< HEAD
  board_pixels : int array array;
=======
  board_pixels : (int * color) array array;
>>>>>>> 089b2d04536241f296ec085dfb1e24cceeec5ce2
  is_over : bool;
}

val square_piece : piece

val straight_piece : piece

val l_piece : piece

val j_piece : piece

val s_piece : piece

val z_piece : piece

val t_piece : piece

<<<<<<< HEAD
val draw_piece : piece -> unit array
=======
val draw_piece : piece -> unit
>>>>>>> 089b2d04536241f296ec085dfb1e24cceeec5ce2

(** Create Initial State **)
val create_init_state : unit -> game_state

<<<<<<< HEAD
val move_piece_horizontally : game_state -> bool -> game_state

val draw_board_pixels : int array array -> unit

val draw_state : game_state -> unit

val key_event : game_state -> unit

val run : game_state -> 'a

=======
>>>>>>> 089b2d04536241f296ec085dfb1e24cceeec5ce2
(* (** GAME OVER **)

   (*returns a cleared graph and draws a new graph with a "Game Over"
   screen; when a piece is generated and any part of it overlaps with
   the block matrix, the game is over*) val game_over : game_state ->
   game_state

   (* randomly generates a new piece at the top of the board, checks to
   see if they overlap and if so end the game, otherwise update the game
   state with this piece as the current piece; change the order maybe of
   drawing and checking*) val generate_new_piece : game_state ->
   game_state

   (*implement soft drop later*)

   (**MOVEMENT**)

   (*Implements the left movement of the current piece. Also checks if
   piece remains within the boundaries of the board*)

   val move_left : game_state -> piece -> game_state

   (*Implements the right movement of the current piece. Also checks if
   piece remains within the boundaries of the board*) val move_right :
   game_state -> piece -> game_state

   (**ROTATION**)

   (*Implements the clockwise movement of the piece. Checks if piece is
   within the boundaries of the game board. If collision is true, return
   the previous state with no change. If false, return the new state
   with rotated piece*)

   val rotate_cw : game_state -> piece -> game_state

   (*Implements the counterclockwise movement of the piece. Checks if
   the piece is within the boundaries of the game board. If true, return
   the previous state with no change. If false, return the new state
   with rotated piece*) val rotate_ccw : game_state -> piece ->
   game_state

   (**LANDING**)

   (*Implements the landing of the piece. Checks if the bottom of any of
   the blocks of the piece touch another block. If true, the current
   piece will stop moving down, and it will be replaced with a new
   piece. If false, the current piece will remain the same*)

   val piece_collision : game_state -> piece -> bool

   val landing : game_state -> piece -> game_state

   (**REMOVE LINES**)

   (*Implements the removal of lines. Checks if any row in the grid is
   completely filled with blocks (probably by checking matrix). If true,
   remove the blocks from the line, and drop all the blocks above down a
   certain amount of rows (depending on the number of lines removed)
   Have variable that tracks number lines removed during a state *)

   val remove_lines : game_state -> game_state *)
<<<<<<< HEAD
=======

val falling_piece : game_state -> unit

val add : int * int -> int * int -> int * int

val gravity : game_state -> int -> unit
>>>>>>> 089b2d04536241f296ec085dfb1e24cceeec5ce2
