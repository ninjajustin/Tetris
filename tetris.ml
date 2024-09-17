open Graphics
open Environment
open Board
open Unix

(* Welcome Screen and Tetris Game Screen *)

(* Defining types for pieces, positions, type location = { x : int; y :
   int; }

   type piece = { create_piece : location list; piece_color : color; }

   type game_state = { piece : piece; piece_location : location; } *)

(* Tetris Pieces *)

let blank_game () =
  print_endline "here";
  open_graph " 600x600";
  let init_game_state = create_init_state () in
  draw_state init_game_state;
  set_color black;
  moveto 50 100;
  draw_string "SCORE: ";
  set_text_size 30;
  moveto 0 0;
  let game_state = create_init_state () in
  gravity game_state 20;
  set_color white;
  run init_game_state draw_gridlines ();
  let _ = wait_next_event [ Button_down ] in
  if button_down () then clear_graph ()

let start_screen () =
  open_graph " 800 x 800";
  resize_window 600 600;
  moveto 250 300;
  draw_string "WELCOME TO TETRIS";
  (* moveto 0 0; draw_piece (20, 50) square_piece; moveto 0 0;
     draw_piece (100, 50) straight_piece; moveto 0 0; draw_piece (150,
     50) l_piece; moveto 0 0; draw_piece (230, 50) j_piece; moveto 0 0;
     draw_piece (310, 50) s_piece; moveto 0 0; draw_piece (420, 50)
     z_piece; moveto 0 0; draw_piece (530, 50) t_piece; set_color black; *)
  moveto 225 175;
  draw_string "Click anywhere to begin";
  let _ = wait_next_event [ Button_down ] in
  if button_down () then blank_game ()
