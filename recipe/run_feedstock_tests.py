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

LINUX_SKIPPED_FILES = {
    "test_dependent_variable_dictionary.py",
    "test_data_horizons.py",
}


def main():
    results = []
    for name in TEST_FILES:
        if sys.platform.startswith("linux") and name in LINUX_SKIPPED_FILES:
            print(f"\nSkipping {name} on Linux", flush=True)
            results.append((name, None))
            continue

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
        if returncode is None:
            status = "SKIP (Linux)"
        else:
            status = "PASS" if returncode == 0 else f"FAIL (exit code {returncode})"
        print(f"  {name}: {status}", flush=True)

    return int(any(returncode not in (None, 0) for _, returncode in results))


if __name__ == "__main__":
    sys.exit(main())
