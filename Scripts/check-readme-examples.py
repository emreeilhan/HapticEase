import platform
from pathlib import Path
import re
import subprocess
import tempfile


root = Path(__file__).resolve().parents[1]
examples = [
    code for code in re.findall(r"```swift\n(.*?)```", (root / "README.md").read_text(), re.S)
    if not code.lstrip().startswith("dependencies:")
]
if not examples:
    raise SystemExit("No standalone Swift examples found in README.md")

sdk = subprocess.check_output(
    ["xcrun", "--sdk", "iphonesimulator", "--show-sdk-path"], text=True
).strip()
with tempfile.TemporaryDirectory() as directory:
    compiler = [
        "xcrun", "swiftc", "-swift-version", "5",
        "-sdk", sdk, "-target", f"{platform.machine()}-apple-ios14.0-simulator",
        "-module-cache-path", str(Path(directory) / "ModuleCache"),
    ]
    subprocess.run(
        compiler + [
            "-emit-module", "-module-name", "HapticEase",
            "-emit-module-path", str(Path(directory) / "HapticEase.swiftmodule"),
        ] + [str(path) for path in sorted((root / "Sources" / "HapticEase").glob("*.swift"))],
        check=True,
    )
    for index, code in enumerate(examples, start=1):
        path = Path(directory) / f"Example{index}.swift"
        path.write_text(code)
        subprocess.run(compiler + ["-typecheck", "-I", directory, str(path)], check=True)
        print(f"README Swift example {index} passed", flush=True)
