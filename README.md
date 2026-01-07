# windows-disk-space-warn

A minimal disk space check that reports when fixed drives fall below a free space threshold.

Author: TABARC-Code  
Plugin URI: https://github.com/TABARC-Code/

## What this does

This script:

- enumerates fixed disks (DriveType = 3)
- calculates free space as a percentage
- prints a warning for any drive at or below the threshold

It does **not**:
- attempt cleanup
- send notifications
- run in the background
- modify anything

It is a simple visibility tool.

## Why this exists

Sometimes you just want a fast answer to:
“Which drive is about to fill up?”

This script gives you that answer without ceremony.

## Script location

In the toolbox repo:

`scripts/05-Disk-Space-Warn.ps1`

## Usage

Default threshold (10 percent):

```powershell
.\scripts\05-Disk-Space-Warn.ps1
Custom threshold:

powershell
Copy code
.\scripts\05-Disk-Space-Warn.ps1 -ThresholdPercent 5
Parameters
-ThresholdPercent (default 10)
Free space percentage at or below which a drive is reported.

Output
Example:

text
Copy code
LOW DISK: C: 8.73%
LOW DISK: D: 4.12%
If nothing is printed, no fixed drives are below the threshold.

How it works
The script queries:

Win32_LogicalDisk with DriveType=3 (local fixed disks)

For each disk with a valid size:

free space percentage is calculated

a warning is printed when the threshold is breached

Removable drives, network shares, and optical media are ignored.

Limitations
