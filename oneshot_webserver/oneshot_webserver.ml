let run input_path port =
  let host = Unix.inet_addr_loopback in
  let addr = Unix.ADDR_INET (host, port) in
  let sock = Unix.socket ~cloexec:true Unix.PF_INET Unix.SOCK_STREAM 0 in
  Unix.setsockopt sock Unix.SO_REUSEADDR true;
  Unix.bind sock addr;
  Unix.listen sock 1;
  let descr, _sockaddr = Unix.accept sock in
  let content = In_channel.with_open_bin input_path In_channel.input_all in
  let content_length = String.length content in
  let out_channel = Unix.out_channel_of_descr descr in
  Printf.fprintf out_channel "HTTP/1.1 200 Ok\nContent-Length: %d\n\n" content_length;
  Out_channel.output_string out_channel content;
  close_out out_channel;
