default: run

# This recipe starts a background process and runs flutter run.
# The background process will be terminated when flutter run exits or is interrupted.
run:
    cd ui && flutter_rust_bridge_codegen generate --watch &
    echo $$ > .codegen.pid 
    trap "kill $$(cat .child_pid) 2>/dev/null; rm -f .codegen.pid" INT TERM EXIT
    cd ui && flutter run

