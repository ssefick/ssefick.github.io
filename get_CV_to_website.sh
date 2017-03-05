#!/usr/bin/env sh

##################################
##variable
cv_dir=${HOME}/Documents/CV
tmp=CV_temp.md
tmp2=tmp_head
out=CV.md
##################################

##################################
##commands
##convert org mode CV to markdown
pandoc -s ${cv_dir}/CV_1.org -o ./${out}

##make temporary file
cat CV.md | egrep "^---$" -A5000 | tail -n+2 | grep "^---$" -A5000 | tail -n+2 > ${tmp}

echo "---" > ${tmp2}
echo "layout: page" >> ${tmp2}
echo "title: CV" >> ${tmp2}
echo "permalink: /CV/" >> ${tmp2}
echo "---" >> ${tmp2}

cat ${tmp2} ${tmp} > ${out}

##clean up
rm -rf ${tmp}
rm -rf ${tmp2}
##################################
