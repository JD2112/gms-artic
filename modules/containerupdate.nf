process containerupdate {

    //input:
    //tuple path('${workflow.workDir}/singularity'), path('*.img')

    script:
    """
    #!/usr/bin/env python3
    import os, time

    path = "${workflow.workDir}/singularity/"
    now = time.time()

    for filename in os.listdir(path):
        filestamp = os.stat(os.path.join(path, filename)).st_mtime
        filecompare = now - 7 * 86400
        if  filestamp < filecompare:
            print(filename)

    """
}