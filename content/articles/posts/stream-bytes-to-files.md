---
title: Stream bytes to files
date: '2010-02-10T00:00:00+08:00'
draft: false
tags:
- dotnet
slug: stream-bytes-to-files
---

```
using(var stream =
  Assembly.GetAssembly(typeof (StubPolicy)).GetManifestResourceStream(
    "Documents.TestHelpers.Files.test.msg")) {
  const int bufferLength = 256;
  var buffer = new Byte\[bufferLength\];
  if (stream != null) {
    int bytesRead = stream.Read(buffer, 0, bufferLength);

    using(var fs = new FileStream(filename, FileMode.CreateNew, FileAccess.Write)) {
      // Write out the input stream
      while (bytesRead > 0) {
        fs.Write(buffer, 0, bytesRead);
        bytesRead = stream.Read(buffer, 0, bufferLength);
      }
      fs.Close();
    }
    stream.Close();
  }
}

```