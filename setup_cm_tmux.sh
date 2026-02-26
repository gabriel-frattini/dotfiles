#!/usr/bin/env fish

# Define your sessions and their windows
set sessions cm_servers cm_dev

set cm_servers_windows api client arne task-service email-service form-widget landingpage
set cm_dev_windows api client arne task-service email-service form-widget landingpage cm-db

function get_windows_for_session -a session
    switch $session
        case cm_servers
            for w in $cm_servers_windows
                echo $w
            end
        case cm_dev
            for w in $cm_dev_windows
                echo $w
            end
    end
end

function create_session -a session
    # Only create if session doesn't already exist
    tmux has-session -t $session > /dev/null 2>&1
    or begin
        # Create a dummy session
        tmux new-session -d -s $session -n dummy

        # Add windows
        for window in (get_windows_for_session $session)
            tmux new-window -t $session -n $window
        end

        # Kill dummy window
        tmux kill-window -t $session:dummy
    end
end

# Create sessions
for s in $sessions
    create_session $s
end

# Commands for cm_servers
tmux send-keys -t cm_servers:api 'cd programming/apps/cm/api; ./dev.sh' C-m
tmux send-keys -t cm_servers:client 'cd programming/apps/cm/client; yarn dev' C-m
tmux send-keys -t cm_servers:arne 'cd programming/apps/cm/arne; source .venv/bin/activate.fish; ./start_server.sh' C-m
tmux send-keys -t cm_servers:task-service 'cd programming/apps/cm/task-service; source .venv/bin/activate.fish; ./run.sh' C-m
tmux send-keys -t cm_servers:email-service 'cd programming/apps/cm/email-service; source .venv/bin/activate.fish; ./start_server.sh' C-m
tmux send-keys -t cm_servers:form-widget 'cd programming/apps/cm/form-widget; yarn dev' C-m
tmux send-keys -t cm_servers:landingpage 'cd programming/apps/cm/landingpage; yarn dev' C-m

# Commands for cm_dev
tmux send-keys -t cm_dev:api 'cd programming/apps/cm/api' C-m
tmux send-keys -t cm_dev:client 'cd programming/apps/cm/client' C-m
tmux send-keys -t cm_dev:arne 'cd programming/apps/cm/arne' C-m
tmux send-keys -t cm_dev:task-service 'cd programming/apps/cm/task-service' C-m
tmux send-keys -t cm_dev:email-service 'cd programming/apps/cm/email-service' C-m
tmux send-keys -t cm_dev:form-widget 'cd programming/apps/cm/form-widget' C-m
tmux send-keys -t cm_dev:landingpage 'cd programming/apps/cm/landingpage' C-m
tmux send-keys -t cm_dev:cm-db 'cd programming/apps/cm/cm-db' C-m

# Attach to cm_dev
tmux attach-session -t cm_dev
