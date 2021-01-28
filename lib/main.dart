// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:io' as io;

void main(List<String> args) async {
    print('Running command: "ls -l"');
    final io.Process process0 = await io.Process.start('ls', ['-l']);
    await io.stdout.addStream(process0.stdout);
    await io.stderr.addStream(process0.stderr);
    if (await process0.exitCode != 0) {
      print("\nls -l first time failed");
      throw 123;
    }
    print('\nRunning command: "flutter version"');
    final io.Process process = await io.Process.start('flutter', ['--version']);
    await io.stdout.addStream(process.stdout);
    await io.stderr.addStream(process.stderr);
    if (await process.exitCode != 0) {
      throw 123;
    }
    print('Running command: "ls -l"');
    final io.Process process2 = await io.Process.start('ls', ['-l']);
    await io.stdout.addStream(process2.stdout);
    await io.stderr.addStream(process2.stderr);
    if (await process2.exitCode != 0) {
      print("\nls -l second time failed");
      throw 123;
    }
    print('success');
}
