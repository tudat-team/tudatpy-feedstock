"""Attempt every configured test file before reporting an overall failure."""

import subprocess
import sys


TEST_FILES = (
    "test_constants.py",
    "test_data.py",
    "test_time_conversions.py",
    "test_dependent_variable_dictionary.py",
    "test_data_mpc.py",
    "test_data_horizons.py",
    "test_data_biases.py",
    "test_data_weights.py",
    "test_processTrk234.py",
    "test_dse_functions.py",
)


def main():
    results = []
    for name in TEST_FILES:
        print(f"\nRunning {name}", flush=True)
        # Preserve the existing process isolation between files, including SPICE state.
        result = subprocess.run(
            [
                sys.executable,
                "-m",
                "pytest",
                "-v",
                "--maxfail=0",
                "--continue-on-collection-errors",
                f"tests/test_tudatpy/{name}",
            ],
            check=False,
        )
        results.append((name, result.returncode))

    print("\nFeedstock test results:", flush=True)
    for name, returncode in results:
        status = "PASS" if returncode == 0 else f"FAIL (exit code {returncode})"
        print(f"  {name}: {status}", flush=True)

    return int(any(returncode != 0 for _, returncode in results))


if __name__ == "__main__":
    sys.exit(main())
