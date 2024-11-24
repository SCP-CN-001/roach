# Roach

This repository provides a migrated version of Roach for CARLA Leaderboard 2.0, serving as part of the benchmark suite. The implementation has referred to the [ThinkTwice](https://github.com/OpenDriveLab/DriveAdapter/tree/main) codebase used for Leaderboard 1.0.

You are welcome to contribute to this repository by creating a pull request.

## Pretrained Models

You can choose the checkpoints by modifying line 98 in `roach/roach_agent.py`:

```python
ckpt = get_absolute_path([path_to_your_checkpoint])
```

- [x] Pre-trained model for CARLA Leaderboard 1.0
- [ ] Pre-trained model for CARLA Leaderboard 2.0

## Quick Start

### Setup the environment

1. Create soft link to the CARLA simulator folder.

    ```shell
    ln -s /path/to/carla-simulator-0.9.10.1 ./CARLA_Leaderboard_10
    ln -s /path/to/carla-simulator-0.9.14 ./CARLA_Leaderboard_20
    ```

2. Pull submodules for the leaderboard.

    ```shell
    git submodule update --init --recursive
    ```

3. Evaluate on CARLA Leaderboard 1.0

    Start the CARLA simulator in one terminal:

    ```shell
    cd CARLA_Leaderboard_10
    ./CarlaUE4.sh --port=2000
    ```

    Run the evaluation script in another terminal:

    ```shell
    cd scripts
    ./L10_run_evaluation.sh
    ```

    To avoid unexpected stop due to Carla Simulator, we recommend to run the evaluation route by route. You can change the route index by modifying `ROUTES_SUBSET` in `L10_run_evaluation.sh`.

4. Run the LeaderboardV2_Roach

    Start the CARLA simulator in one terminal:

    ```shell
    cd CARLA_Leaderboard_20
    ./CarlaUE4.sh --port=2000
    ```

    Run the evaluation script in another terminal:

    ```shell
    cd scripts
    ./L20_run_evaluation.sh
    ```

    To avoid unexpected stop due to Carla Simulator, we recommend to run the evaluation route by route. You can change the route index by modifying `ROUTES_SUBSET` in `L20_run_evaluation.sh`.

## Thanks to

- [ThinkTwice](https://github.com/OpenDriveLab/DriveAdapter/tree/main)'s implementation version.
- [Roach](https://github.com/zhejz/carla-roach)'s original implementation version.

## Citation

This repository is a part of the benchmark suite for the CARLA Leaderboard 2.0. If you use this repository in your research, please cite the following paper:

```bibtex
@article{jiang2024hope,
  title={HOPE: A Reinforcement Learning-based Hybrid Policy Path Planner for Diverse Parking Scenarios},
  author={Jiang, Mingyang and Li, Yueyuan and Zhang, Songan and Chen, Siyuan and Wang, Chunxiang and Yang, Ming},
  journal={arXiv preprint arXiv:2405.20579},
  year={2024}
}
```
