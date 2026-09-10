# Artifact Inventory

This inventory records supplied binary inputs without making claims about their origin, license, behavior, or safety.

| File | Size (bytes) | SHA-256 | Tracking |
| --- | ---: | --- | --- |
| `sniffies-app-c0f0650.apk` | 77,042,648 | `e1d5df345a1be97b254f0f6d68c68ad99f637e195f58826e6db5e58751d16091` | Existing Git blob; future `.apk` additions use Git LFS |

Verify an artifact before relying on it:

```powershell
Get-FileHash -LiteralPath .\sniffies-app-c0f0650.apk -Algorithm SHA256
```

Do not replace an inventory entry without recording the source, version, checksum, and validation method in the related pull request.
