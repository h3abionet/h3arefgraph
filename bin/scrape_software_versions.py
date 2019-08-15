#!/usr/bin/env python
from __future__ import print_function
from collections import OrderedDict
import re

# TODO nf-core: Add additional regexes for new tools in process get_software_versions
regexes = {
    'h3abionet/h3arefgraph': ['v_pipeline.txt', r"(\S+)"],
    'Nextflow': ['v_nextflow.txt', r"(\S+)"],
    'FastQC': ['v_fastqc.txt', r"FastQC v(\S+)"],
    'Trim_Galore': ['v_trimgalore.txt', r"version(\S+)"],
    'Cutadapt' : ['v_cutadapt.txt', r"(\S+)"],
    'MultiQC': ['v_multiqc.txt', r"multiqc, version (\S+)"],
}
results = OrderedDict()
results['h3abionet/h3arefgraph'] = '<span style="color:#999999;\">N/A</span>'
results['Nextflow'] = '<span style="color:#999999;\">N/A</span>'
results['FastQC'] = '<span style="color:#999999;\">N/A</span>'
results['Trim_Galore'] = '<span style="color:#999999;\">N/A</span>'
results['Cutadapt'] = '<span style="color:#999999;\">N/A</span>'
results['MultiQC'] = '<span style="color:#999999;\">N/A</span>'

# Search each file using its regex
for k, v in regexes.items():
    with open(v[0]) as x:
        versions = x.read()
        match = re.search(v[1], versions)
        if match:
            results[k] = "v{}".format(match.group(1))

# Dump to YAML
print ('''
id: 'h3abionet/h3arefgraph-software-versions'
section_name: 'h3abionet/h3arefgraph Software Versions'
section_href: 'https://github.com/h3abionet/h3arefgraph'
plot_type: 'html'
description: 'are collected at run time from the software output.'
data: |
    <dl class="dl-horizontal">
''')
for k,v in results.items():
    print("        <dt>{}</dt><dd>{}</dd>".format(k,v))
print ("    </dl>")
