open Core.Std
open Opium.Std

let log_msg s = Lwt_log.ign_info s

let print_json req =
  req |> App.string_of_body_exn
      |> Lwt.map (fun rawBody ->
          (log_msg rawBody;
          respond (`String rawBody)))

(*let cmd_debug (deb : bool) (t : App.t) = { t with debug = deb }
*)

let _ =
  App.empty
  |> post "/" print_json
  |> App.run_command
