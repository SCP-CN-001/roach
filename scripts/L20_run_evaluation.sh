# setup environment variables
export SHELL_PATH=$(dirname $(readlink -f $0))
export WORKSPACE=${SHELL_PATH}/..
export CARLA_ROOT=${WORKSPACE}/CARLA_Leaderboard_20
export LEADERBOARD_ROOT=${WORKSPACE}/leaderboard_20/leaderboard
export SCENARIO_RUNNER_ROOT=${WORKSPACE}/leaderboard_20/scenario_runner

export PYTHONPATH=$PYTHONPATH:${CARLA_ROOT}/PythonAPI/carla
export PYTHONPATH=$PYTHONPATH:${CARLA_ROOT}/PythonAPI/carla/dist/carla-0.9.14-py3.7-linux-x86_64.egg
export PYTHONPATH=$PYTHONPATH:${LEADERBOARD_ROOT}
export PYTHONPATH=$PYTHONPATH:${SCENARIO_RUNNER_ROOT}
export PYTHONPATH=$PYTHONPATH:${WORKSPACE}

# general parameters
export PORT=2000
export TM_PORT=2500
export DEBUG_CHALLENGE=0

# Roach data collection
export CHALLENGE_TRACK_CODENAME=MAP
export ROUTES=${LEADERBOARD_ROOT}/data/routes_validation.xml
export ROUTES_SUBSET=0
export REPETITIONS=1

# agent-related options
export TEAM_AGENT=${WORKSPACE}/roach/roach_agent.py
export TEAM_CONFIG=${WORKSPACE}/roach/configs/roach_agent.yaml
export CHECKPOINT_ENDPOINT=${WORKSPACE}/logs/L20_validation/log_route_${ROUTES_SUBSET}.json

export PYTHON_FILE=${WORKSPACE}/roach/leaderboard_custom/leaderboard_evaluator.py

python ${PYTHON_FILE} \
    --port=${PORT} \
    --traffic-manager-port=${TM_PORT} \
    --debug=${DEBUG_CHALLENGE} \
    --routes=${ROUTES} \
    --routes-subset=${ROUTES_SUBSET} \
    --repetitions=${REPETITIONS} \
    --track=${CHALLENGE_TRACK_CODENAME} \
    --agent=${TEAM_AGENT} \
    --agent-config=${TEAM_CONFIG} \
    --checkpoint=${CHECKPOINT_ENDPOINT} \
    --resume=${RESUME} \
    --traffic-manager-seed=${TM_SEED} \
    --is_eval=True
