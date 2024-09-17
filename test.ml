open OUnit2
open Graphics
open Board
open Environment
open Tetris
open Unix

let get_location (state : Environment.game_state) = 
  state.current_piece.piece_location

let piece_collision_test (name : string) (state : Environment.game_state) (piece: Environment.piece)
(expected_output : bool) : test =
  name >:: (fun _ -> 
      assert_equal expected_output (piece_collision state piece))

let right_movement_test (name : string) (state : Environment.game_state) 
(expected_output : Environment.location) : test =
  name >:: (fun _ -> 
      assert_equal expected_output (get_location(move_piece_right state)))
  
let left_movement_test (name : string) (state : Environment.game_state) 
(expected_output : Environment.location) : test =
  name >:: (fun _ -> 
      assert_equal expected_output (get_location(move_piece_left state)))

let rotate_piece_cw_test (name : string) (state : Environment.game_state) 
(expected_output : Environment.location) : test =
  name >:: (fun _ -> 
      assert_equal expected_output (get_location(rotate_piece_cw state)))

let rotate_piece_ccw_test (name : string) (state : Environment.game_state) 
(expected_output : Environment.location) : test =
  name >:: (fun _ -> 
      assert_equal expected_output (get_location(rotate_piece_ccw state)))

let key_event_test (name : string) (state : Environment.game_state) 
(expected_output : Environment.location) : test =
  name >:: (fun _ -> 
      assert_equal expected_output (get_location(key_event state)))
    

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

let state = Environment.create_init_state()

let square_state = { state with current_piece = square_piece }
let straight_state = { state with current_piece = straight_piece }
let l_state = { state with current_piece = l_piece }
let j_state = { state with current_piece = j_piece }
let s_state = { state with current_piece = s_piece }
let z_state = { state with current_piece = z_piece }
let t_state = { state with current_piece = t_piece }

let game_over state = { state with is_over = true }


let movement_tests = [
  right_movement_test "Move square piece right" square_state (1, 2);
  right_movement_test "Move line piece right" straight_state (1, 2);
  right_movement_test "Move l piece right" l_state (1, 2);
  right_movement_test "Move j piece right" j_state (1, 2);
  right_movement_test "Move s piece right" s_state (1, 2);
  right_movement_test "Move z piece right" z_state (1, 2);
  right_movement_test "Move t piece right" t_state (1, 2);
  
  left_movement_test "Move square piece left" square_state (1, 2);
  left_movement_test "Move line piece left" straight_state (1, 2);
  left_movement_test "Move l piece left" l_state (1, 2);
  left_movement_test "Move j piece left" j_state (1, 2);
  left_movement_test "Move s piece left" s_state (1, 2);
  left_movement_test "Move z piece legt" z_state (1, 2);
  left_movement_test "Move t piece left" t_state (1, 2);
]

let rotation_tests = [
  rotate_piece_cw_test "Rotate square piece cw" square_state (1, 2);
  right_movement_test "Move line piece right" straight_state (1, 2);
  right_movement_test "Move l piece right" l_state (1, 2);
  right_movement_test "Move j piece right" j_state (1, 2);
  right_movement_test "Move s piece right" s_state (1, 2);
  right_movement_test "Move z piece right" z_state (1, 2);
  right_movement_test "Move t piece right" t_state (1, 2);
  
  left_movement_test "Move square piece left" square_state (1, 2);
  left_movement_test "Move line piece left" straight_state (1, 2);
  left_movement_test "Move l piece left" l_state (1, 2);
  left_movement_test "Move j piece left" j_state (1, 2);
  left_movement_test "Move s piece left" s_state (1, 2);
  left_movement_test "Move z piece legt" z_state (1, 2);
  left_movement_test "Move t piece left" t_state (1, 2);
]

let suite =
  "test suite for Tetris"
  >::: List.flatten [ movement_tests; ]

let _ = run_test_tt_main suite