open Graphics
open Board
open Unix
open Glut

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
  is_over : bool;
}

let orange = rgb 255 165 0
=======
  board_pixels : (int * color) array array;
  is_over : bool;
}

let orange = Graphics.rgb 255 165 0
>>>>>>> 089b2d04536241f296ec085dfb1e24cceeec5ce2

let square_piece =
  {
    piece_location = (4, 19);
    piece_shape = [| (0, 0); (0, 1); (1, 1); (1, 0) |];
    piece_color = yellow;
  }

let straight_piece =
  {
    piece_location = (3, 19);
    piece_shape = [| (0, 0); (1, 0); (2, 0); (3, 0) |];
    piece_color = cyan;
  }

let l_piece : piece =
  {
    piece_location = (4, 19);
<<<<<<< HEAD
    piece_shape = [| (0, 0); (1, 0); (2, 0); (2, 1) |];
=======
    piece_shape = [| (0, 1); (0, 0); (1, 0); (2, 0) |];
>>>>>>> 089b2d04536241f296ec085dfb1e24cceeec5ce2
    piece_color = orange;
  }

let j_piece : piece =
  {
    piece_location = (4, 19);
<<<<<<< HEAD
    piece_shape = [| (0, 1); (0, 0); (1, 0); (2, 0) |];
=======
    piece_shape = [| (0, 0); (1, 0); (2, 0); (2, 1) |];
>>>>>>> 089b2d04536241f296ec085dfb1e24cceeec5ce2
    piece_color = blue;
  }

let s_piece : piece =
  {
    piece_location = (4, 19);
    piece_shape = [| (0, 0); (1, 0); (1, 1); (2, 1) |];
    piece_color = green;
  }

let z_piece : piece =
  {
    piece_location = (3, 19);
    piece_shape = [| (0, 1); (1, 1); (1, 0); (2, 0) |];
    piece_color = red;
  }

let t_piece : piece =
  {
    piece_location = (4, 19);
    piece_shape = [| (0, 0); (1, 0); (2, 0); (1, 1) |];
    piece_color = magenta;
  }

(* gets the lower left coordinate of a pixel*)
let get_coordinates_from_pixel pixel =
  ((fst pixel * 30) + 150, snd pixel * 30)

(* draws each individual pixel from its lower left coordinate to display
   a square*)
let draw_pixel pixel =
  let coord = get_coordinates_from_pixel pixel in
  fill_rect (fst coord) (snd coord) 30 30

<<<<<<< HEAD
(*draws squares using individual pixels to form a piece*)
=======
>>>>>>> 089b2d04536241f296ec085dfb1e24cceeec5ce2
let add start_coord coordinate =
  (fst start_coord + fst coordinate, snd start_coord + snd coordinate)

let set_coordinates piece =
  Array.map (add piece.piece_location) piece.piece_shape

<<<<<<< HEAD
let draw_piece current_piece =
  set_color current_piece.piece_color;
  Array.map draw_pixel (set_coordinates current_piece)
=======
(*draws squares using individual pixels to form a piece*)
let draw_piece current_piece =
  set_color current_piece.piece_color;
  Array.map draw_pixel (set_coordinates current_piece);
  ()

let clear_previous_position previous_piece =
  set_color black;
  Array.map draw_pixel (set_coordinates previous_piece);
  ()
>>>>>>> 089b2d04536241f296ec085dfb1e24cceeec5ce2

let create_piece piece_id =
  match piece_id with
  | 0 -> square_piece
  | 1 -> straight_piece
  | 2 -> l_piece
  | 3 -> j_piece
  | 4 -> s_piece
  | 5 -> z_piece
  | 6 -> t_piece
  | _ -> square_piece

let create_init_state () =
  {
<<<<<<< HEAD
    current_piece = create_piece (Random.int 7);
    score = 0;
    gravity = 1;
    upcoming_pieces = [];
    board_pixels = Array.make_matrix 10 20 0;
=======
    current_piece =
      create_piece
        (Random.self_init ();
         Random.int 7);
    score = 0;
    gravity = 1;
    upcoming_pieces = [];
    board_pixels = Array.make_matrix 10 20 (0, black);
>>>>>>> 089b2d04536241f296ec085dfb1e24cceeec5ce2
    is_over = false;
  }

let game_over state = { state with is_over = true }

(*let piece_collision state current_piece =*)

let generate_new_piece state =
<<<<<<< HEAD
  let new_piece = create_piece (Random.int 7) in
=======
  let new_piece =
    create_piece
      (Random.self_init ();
       Random.int 7)
  in
>>>>>>> 089b2d04536241f296ec085dfb1e24cceeec5ce2
  { state with current_piece = new_piece }

let draw_board_pixels board =
  for w = 0 to 9 do
    for h = 0 to 19 do
<<<<<<< HEAD
      if board.(w).(h) = 0 then set_color black;
      draw_pixel (w, h)
    done
  done

let convert_to_unit unit_array = ()

let draw_gridlines () =
  set_color white;
  let segment_array =
    [|
      (150, 30, 450, 30);
      (150, 60, 450, 60);
      (150, 90, 450, 90);
      (150, 120, 450, 120);
      (150, 150, 450, 150);
      (150, 180, 450, 180);
      (150, 210, 450, 210);
      (150, 240, 450, 240);
      (150, 270, 450, 270);
      (150, 300, 450, 300);
      (150, 330, 450, 330);
      (150, 360, 450, 360);
      (150, 390, 450, 390);
      (150, 420, 450, 420);
      (150, 450, 450, 450);
      (150, 480, 450, 480);
      (150, 510, 450, 510);
      (150, 540, 450, 540);
      (150, 570, 450, 570);
      (180, 0, 180, 600);
      (210, 0, 210, 600);
      (240, 0, 240, 600);
      (270, 0, 270, 600);
      (300, 0, 300, 600);
      (330, 0, 330, 600);
      (360, 0, 360, 600);
      (390, 0, 390, 600);
      (420, 0, 420, 600);
    |]
  in
  draw_segments segment_array

let draw_state state =
  clear_graph ();
  open_graph " 600x600";
  draw_board_pixels state.board_pixels;
  convert_to_unit (draw_piece state.current_piece);
  draw_gridlines ()

=======
      if board.(w).(h) = 1 then draw_pixel (w, h)
    done
  done

>>>>>>> 089b2d04536241f296ec085dfb1e24cceeec5ce2
(*let draw_state state = clear_graph (); open_graph " 600x600";
  fill_rect 150 0 300 600; moveto 50 100; draw_string "SCORE: ";

  draw_piece state.current_piece;

  draw_gridlines () *)
<<<<<<< HEAD
let move_piece_horizontally game_state is_right =
  let move_by = if is_right then 1 else -1 in
  let loc = game_state.current_piece.piece_location in
  let new_piece =
    {
      game_state.current_piece with
      piece_location = (fst loc + move_by, snd loc);
    }
  in
  { game_state with current_piece = new_piece }

let key_event state =
  let event = wait_next_event [ Key_pressed ] in
  if event.keypressed then
    match read_key () with
    | 'd' ->
        let new_state = move_piece_horizontally state true in
        draw_state new_state
    | 'a' ->
        let new_state = move_piece_horizontally state false in
        draw_state new_state
    | x -> ()

let rec run state =
  key_event state;
  let new_state = move_piece_horizontally state true in
  run new_state
=======

let falling_piece game_state =
  clear_previous_position game_state.current_piece;
  game_state.current_piece.piece_location <-
    add game_state.current_piece.piece_location (0, -1);
  draw_piece game_state.current_piece;
  set_color white;
  draw_gridlines ()

let pause () = Unix.sleepf 1.0

let rec gravity game_state row =
  if row > 1 then begin
    falling_piece game_state;
    pause ();
    gravity game_state (row - 1)
  end
>>>>>>> 089b2d04536241f296ec085dfb1e24cceeec5ce2
