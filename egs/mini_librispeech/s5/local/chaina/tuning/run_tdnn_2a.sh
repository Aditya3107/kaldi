#!/bin/bash

# 2a is for the new inside-model stuff.

# 1j is as 1i but with smoothing-count=100 on the fMLLR
# Seems better!!
# Note: although we're still worse than the baseline chain system, it turns out we were
# getting a lot  of improvement from the 'combine' stage (maybe 3% absolute), so implementing
# that should make a fairly big difference.

# a09:s5: grep WER exp/chaina/tdnn1j_sp/decode_dev_clean_2_tgsmall.si/wer_* | utils/best_wer.sh
#%WER 16.56 [ 3334 / 20138, 289 ins, 470 del, 2575 sub ] exp/chaina/tdnn1j_sp/decode_dev_clean_2_tgsmall.si/wer_11_0.0
#a09:s5: grep WER exp/chaina/tdnn1j_sp/decode_dev_clean_2_tgsmall/wer_* | utils/best_wer.sh
#%WER 12.95 [ 2608 / 20138, 248 ins, 383 del, 1977 sub ] exp/chaina/tdnn1j_sp/decode_dev_clean_2_tgsmall/wer_12_0.0
## And a rerun:
# a09:s5:  grep WER exp/chaina/tdnn1j2_sp/decode_dev_clean_2_tgsmall.si/wer_* | utils/best_wer.sh
# %WER 16.08 [ 3239 / 20138, 272 ins, 484 del, 2483 sub ] exp/chaina/tdnn1j2_sp/decode_dev_clean_2_tgsmall.si/wer_11_0.0
# a09:s5:  grep WER exp/chaina/tdnn1j2_sp/decode_dev_clean_2_tgsmall/wer_* | utils/best_wer.sh
# %WER 13.16 [ 2651 / 20138, 236 ins, 402 del, 2013 sub ] exp/chaina/tdnn1j2_sp/decode_dev_clean_2_tgsmall/wer_12_0.0

## Then after introducing model combination we got:
# grep WER exp/chaina/tdnn1j2_sp/decode_dev_clean_2_tgsmall.si/wer_* | utils/best_wer.sh
#%WER 14.53 [ 2927 / 20138, 301 ins, 347 del, 2279 sub ] exp/chaina/tdnn1j2_sp/decode_dev_clean_2_tgsmall.si/wer_11_0.0
#b10:s5:  grep WER exp/chaina/tdnn1j2_sp/decode_dev_clean_2_tgsmall/wer_* | utils/best_wer.sh
#%WER 11.34 [ 2283 / 20138, 234 ins, 303 del, 1746 sub ] exp/chaina/tdnn1j2_sp/decode_dev_clean_2_tgsmall/wer_12_0.0
# And after LM rescoring:
# %WER 8.26 [ 1663 / 20138, 243 ins, 147 del, 1273 sub ] exp/chaina/tdnn1j2_sp/decode_dev_clean_2_tglarge/wer_10_0.5

# the baseline 1i:
#a09:s5: grep WER exp/chaina/tdnn1i_sp/decode_dev_clean_2_tgsmall.si/wer_* | utils/best_wer.sh
#%WER 16.85 [ 3393 / 20138, 310 ins, 481 del, 2602 sub ] exp/chaina/tdnn1i_sp/decode_dev_clean_2_tgsmall.si/wer_11_0.0
#a09:s5: grep WER exp/chaina/tdnn1i_sp/decode_dev_clean_2_tgsmall/wer_* | utils/best_wer.sh
#%WER 13.37 [ 2693 / 20138, 243 ins, 398 del, 2052 sub ] exp/chaina/tdnn1i_sp/decode_dev_clean_2_tgsmall/wer_12_0.0
# a rerun of the baseline 1i:
#a09:s5: grep WER exp/chaina/tdnn1i2_sp/decode_dev_clean_2_tgsmall.si/wer_* | utils/best_wer.sh
#%WER 16.71 [ 3365 / 20138, 255 ins, 567 del, 2543 sub ] exp/chaina/tdnn1i2_sp/decode_dev_clean_2_tgsmall.si/wer_12_0.0
#a09:s5: grep WER exp/chaina/tdnn1i2_sp/decode_dev_clean_2_tgsmall/wer_* | utils/best_wer.sh
#%WER 13.28 [ 2675 / 20138, 259 ins, 374 del, 2042 sub ] exp/chaina/tdnn1i2_sp/decode_dev_clean_2_tgsmall/wer_11_0.0


# 1i is as 1h but replacing half the mean-transformed dims with fMLLR in blocks of 8.

# 1h is as 1g but reducing the num-leaves (as in 1c3 -> 1f)
# 1g is as 1c2 but using MeanOnlyTransform.  Better!!

# a09:s5: grep WER exp/chaina/tdnn1g_sp/decode_dev_clean_2_tgsmall.si/wer_* | utils/best_wer.sh
# %WER 17.08 [ 3439 / 20138, 361 ins, 467 del, 2611 sub ] exp/chaina/tdnn1g_sp/decode_dev_clean_2_tgsmall.si/wer_11_0.0
# grep WER exp/chaina/tdnn1g_sp/decode_dev_clean_2_tgsmall/wer_* | utils/best_wer.sh
# %WER 14.68 [ 2956 / 20138, 243 ins, 519 del, 2194 sub ] exp/chaina/tdnn1g_sp/decode_dev_clean_2_tgsmall/wer_12_0.5
#
# vs. the baseline:
# grep WER exp/chaina/tdnn1c2_sp/decode_dev_clean_2_tgsmall.si/wer_* | utils/best_wer.sh
# %WER 16.30 [ 3282 / 20138, 323 ins, 458 del, 2501 sub ] exp/chaina/tdnn1c2_sp/decode_dev_clean_2_tgsmall.si/wer_11_0.0
# a09:s5: grep WER exp/chaina/tdnn1c2_sp/decode_dev_clean_2_tgsmall/wer_* | utils/best_wer.sh
# %WER 15.88 [ 3197 / 20138, 296 ins, 462 del, 2439 sub ] exp/chaina/tdnn1c2_sp/decode_dev_clean_2_tgsmall/wer_12_0.0

# 1c2 is as 1c but changing num-epochs from

# 1c is a sanity check that the baseline setup is working well;
# we're simply making the transform a NoOpTransform, so the two decoding
# passes should give almost the same results.


# grep WER exp/chaina/tdnn1c_sp/decode_dev_clean_2_tgsmall.si/wer_* | utils/best_wer.sh
# %WER 18.27 [ 3679 / 20138, 334 ins, 565 del, 2780 sub ] exp/chaina/tdnn1c_sp/decode_dev_clean_2_tgsmall.si/wer_13_0.0
#a09:s5: grep WER exp/chaina/tdnn1c_sp/decode_dev_clean_2_tgsmall/wer_* | utils/best_wer.sh
# %WER 18.09 [ 3643 / 20138, 324 ins, 552 del, 2767 sub ] exp/chaina/tdnn1c_sp/decode_dev_clean_2_tgsmall/wer_15_0.0


# Set -e here so that we catch if any executable fails immediately
set -euo pipefail

# First the options that are passed through to run_ivector_common.sh
# (some of which are also used in this script directly).
stage=0
decode_nj=10
train_set=train_clean_5
test_sets=dev_clean_2
gmm=tri3b
srand=0
nnet3_affix=

# The rest are configs specific to this script.  Most of the parameters
# are just hardcoded at this level, in the commands below.
affix=1j   # affix for the TDNN directory name
tree_affix=b
train_stage=-10
get_egs_stage=-10
common_egs_dir=exp/chaina/tdnn1f_sp/egs

# training chunk-options
chunk_width=140
dropout_schedule='0,0@0.20,0.3@0.50,0'
xent_regularize=0.1
bottom_subsampling_factor=3
frame_subsampling_factor=3
langs="default"  # list of language names

# The amount of extra left/right context we put in the egs.  Note: this could
# easily be zero, since we're not using a recurrent topology, but we put in a
# little extra context so that we have more room to play with the configuration
# without re-dumping egs.
egs_extra_left_context=5
egs_extra_right_context=5

# The number of chunks (of length: see $chunk_width above) that we group
# together for each "speaker" (actually: pseudo-speaker, since we may have
# to group multiple speaker together in some cases).
chunks_per_group=4


# End configuration section.
echo "$0 $@"  # Print the command line for logging

. ./cmd.sh
. ./path.sh
. ./utils/parse_options.sh

if ! cuda-compiled; then
  cat <<EOF && exit 1
This script is intended to be used with GPUs but you have not compiled Kaldi with CUDA
If you want to use GPUs (and have them), go to src/, and configure and make on a machine
where "nvcc" is installed.
EOF
fi

local/chaina/data_prep_common.sh --stage $stage \
                                 --train-set $train_set \
                                 --gmm $gmm  || exit 1;

# Problem: We have removed the "train_" prefix of our training set in
# the alignment directory names! Bad!
gmm_dir=exp/$gmm
ali_dir=exp/${gmm}_ali_${train_set}_sp
tree_dir=exp/chaina/tree_sp${tree_affix:+_$tree_affix}
lang=data/lang_chain
lat_dir=exp/chaina/${gmm}_${train_set}_sp_lats
dir=exp/chaina/tdnn${affix}_sp
train_data_dir=data/${train_set}_sp_hires
lores_train_data_dir=data/${train_set}_sp

for f in $gmm_dir/final.mdl $train_data_dir/feats.scp \
    $lores_train_data_dir/feats.scp $ali_dir/ali.1.gz; do
  [ ! -f $f ] && echo "$0: expected file $f to exist" && exit 1
done

if [ $stage -le 10 ]; then
  echo "$0: creating lang directory $lang with chain-type topology"
  # Create a version of the lang/ directory that has one state per phone in the
  # topo file. [note, it really has two states.. the first one is only repeated
  # once, the second one has zero or more repeats.]
  if [ -d $lang ]; then
    if [ $lang/L.fst -nt data/lang/L.fst ]; then
      echo "$0: $lang already exists, not overwriting it; continuing"
    else
      echo "$0: $lang already exists and seems to be older than data/lang..."
      echo " ... not sure what to do.  Exiting."
      exit 1;
    fi
  else
    cp -r data/lang $lang
    silphonelist=$(cat $lang/phones/silence.csl) || exit 1;
    nonsilphonelist=$(cat $lang/phones/nonsilence.csl) || exit 1;
    # Use our special topology... note that later on may have to tune this
    # topology.
    steps/nnet3/chain/gen_topo.py $nonsilphonelist $silphonelist >$lang/topo
  fi
fi

if [ $stage -le 11 ]; then
  # Get the alignments as lattices (gives the chain training more freedom).
  # use the same num-jobs as the alignments
  steps/align_fmllr_lats.sh --nj 75 --cmd "$train_cmd" ${lores_train_data_dir} \
    data/lang $gmm_dir $lat_dir
  rm $lat_dir/fsts.*.gz # save space
fi

if [ $stage -le 12 ]; then
  # Build a tree using our new topology.  We know we have alignments for the
  # speed-perturbed data (local/nnet3/run_ivector_common.sh made them), so use
  # those.  The num-leaves is always somewhat less than the num-leaves from
  # the GMM baseline.
  # This will be a two-level tree (with the smaller number of leaves specified
  # by the '--num-clusters' option); this is needed by the adaptation framework
  # search below for 'tree.map'
   if [ -f $tree_dir/final.mdl ]; then
     echo "$0: $tree_dir/final.mdl already exists, refusing to overwrite it."
     exit 1;
  fi
   steps/nnet3/chain/build_tree.sh \
     --num-clusters 200 \
     --frame-subsampling-factor ${frame_subsampling_factor} \
     --context-opts "--context-width=2 --central-position=1" \
     --cmd "$train_cmd" 2900 ${lores_train_data_dir} \
     $lang $ali_dir $tree_dir
fi


# $dir/configs will contain xconfig and config files for the initial
# models.  It's a scratch space used by this script but not by
# scripts called from here.
mkdir -p $dir/configs/
# $dir/init will contain the initial models
mkdir -p $dir/init/

l2=0.03
tdnn_opts="l2-regularize=0.03 dropout-proportion=0.0 dropout-per-dim-continuous=true"
tdnnf_opts="l2-regularize=0.03 dropout-proportion=0.0 bypass-scale=0.66"
linear_opts="l2-regularize=0.03 orthonormal-constraint=-1.0"
prefinal_opts="l2-regularize=0.03"
output_opts="l2-regularize=0.015"
num_leaves=$(tree-info $tree_dir/tree |grep num-pdfs|awk '{print $2}')
learning_rate_factor=$(echo "print 0.5/$xent_regularize" | python)




if [ $stage -le 13 ]; then
  echo "$0: creating neural net using the xconfig parser";

  cat <<EOF >$dir/configs/input_transform.txt
MeanOnlyTransform dim=40
EOF


  cat <<EOF >$dir/configs/xconfig
  input dim=40 name=input
  adaptation-component name=input-adapt num-classes=200 config-file=$dir/configs/input_transform.txt
  batchnorm-component name=input-batchnorm
  relu-batchnorm-dropout-layer name=tdnn1 $tdnn_opts dim=768 input=Append(-1,0,1)
  tdnnf-layer name=tdnnf2 $tdnnf_opts dim=768 bottleneck-dim=96 time-stride=1
  tdnnf-layer name=tdnnf3 $tdnnf_opts dim=768 bottleneck-dim=96 time-stride=1
  tdnnf-layer name=tdnnf4 $tdnnf_opts dim=768 bottleneck-dim=96 time-stride=1
  tdnnf-layer name=tdnnf5 $tdnnf_opts dim=768 bottleneck-dim=96 time-stride=0
  tdnnf-layer name=tdnnf6 $tdnnf_opts dim=768 bottleneck-dim=96 time-stride=3
  tdnnf-layer name=tdnnf7 $tdnnf_opts dim=768 bottleneck-dim=96 time-stride=3
  tdnnf-layer name=tdnnf8 $tdnnf_opts dim=768 bottleneck-dim=96 time-stride=3
  tdnnf-layer name=tdnnf9 $tdnnf_opts dim=768 bottleneck-dim=96 time-stride=3
  tdnnf-layer name=tdnnf10 $tdnnf_opts dim=768 bottleneck-dim=96 time-stride=3
  tdnnf-layer name=tdnnf11 $tdnnf_opts dim=768 bottleneck-dim=96 time-stride=3
  tdnnf-layer name=tdnnf12 $tdnnf_opts dim=768 bottleneck-dim=96 time-stride=3
  tdnnf-layer name=tdnnf13 $tdnnf_opts dim=768 bottleneck-dim=96 time-stride=3
  linear-component name=prefinal-l dim=192 $linear_opts

  # adding the output layer for chain branch
  prefinal-layer name=prefinal-chain input=prefinal-l $prefinal_opts small-dim=192 big-dim=768
  output-layer name=output include-log-softmax=false dim=$num_leaves $output_opts
  # .. and its speaker-independent version
  prefinal-layer name=prefinal-chain-si input=prefinal-l $prefinal_opts small-dim=192 big-dim=768
  output-layer name=output-si include-log-softmax=false dim=$num_leaves $output_opts

  # adding the output layer for xent branch
  prefinal-layer name=prefinal-xent input=prefinal-l $prefinal_opts small-dim=192 big-dim=768
  output-layer name=output-xent dim=$num_leaves learning-rate-factor=$learning_rate_factor $output_opts
  # .. and its speaker-independent version
  prefinal-layer name=prefinal-xent-si input=prefinal-l $prefinal_opts small-dim=192 big-dim=768
  output-layer name=output-si-xent dim=$num_leaves learning-rate-factor=$learning_rate_factor $output_opts
EOF
  steps/nnet3/xconfig_to_config.py --xconfig-file $dir/configs/default.xconfig \
                                   --config-file-out $dir/configs/default.config
  nnet3-init --srand=$srand $dir/configs/default.config - | \
     nnet3-am-init $tree_dir/final.mdl - $dir/init/default.mdl
fi


if [ $stage -le 16 ]; then
  # Work out the model's total effective left and right context (in the
  # feature frame-sampling rate).
  # The following script is equivalent to doing something like the
  # following:
  # cat > $dir/init/info.txt <<EOF
  # langs default
  # frame_subsampling_factor 3
  # bottom_subsampling_factor 3
  # model_left_context 22
  # model_right_context 22
  # EOF
  #
  # note: $langs is "default"
  steps/chaina/get_model_context.sh \
        --frame-subsampling-factor $frame_subsampling_factor \
        --bottom-subsampling-factor $bottom_subsampling_factor \
       --langs "$langs" $dir/init/ $dir/init/info.txt
fi


if [ $stage -le 17 ]; then
  # Make phone LM and denominator and normalization FST
  mkdir -p $dir/den_fsts/log

  # We may later reorganize this.
  cp $tree_dir/tree $dir/default.tree

  echo "$0: creating phone language-model"
  $cmd $dir/den_fsts/log/make_phone_lm_default.log \
    chain-est-phone-lm --num-extra-lm-states=2000 \
       "ark:gunzip -c $gmm_dir/ali.*.gz | ali-to-phones $gmm_dir/final.mdl ark:- ark:- |" \
       $dir/den_fsts/default.phone_lm.fst

  echo "$0: creating denominator FST"
  $cmd $dir/den_fsts/log/make_den_fst.log \
     chain-make-den-fst $dir/default.tree $dir/init/default.mdl $dir/den_fsts/default.phone_lm.fst \
     $dir/den_fsts/default.den.fst $dir/den_fsts/default.normalization.fst || exit 1;
fi


model_left_context=$(awk '/^model_left_context/ {print $2;}' $dir/init/info.txt)
model_right_context=$(awk '/^model_right_context/ {print $2;}' $dir/init/info.txt)
# Note: we add frame_subsampling_factor/2 so that we can support the frame
# shifting that's done during training, so if frame-subsampling-factor=3, we
# train on the same egs with the input shifted by -1,0,1 frames.  This is done
# via the --frame-shift option to nnet3-chain-copy-egs in the script.
egs_left_context=$[model_left_context+(frame_subsampling_factor/2)+egs_extra_left_context]
egs_right_context=$[model_right_context+(frame_subsampling_factor/2)+egs_extra_right_context]

for d in $dir/raw_egs $dir/processed_egs; do
  if [[ $(hostname -f) == *.clsp.jhu.edu ]] && [ ! -d $d/storage ] ; then
    mkdir -p $d
    utils/create_split_dir.pl \
      /export/b0{3,4,5,6}/$USER/kaldi-data/egs/mini_librispeech-$(date +'%m_%d_%H_%M')/s5/$d/storage $d/storage
  fi
done


if [ $stage -le 18 ] && [ -z $common_egs_dir ]; then
  echo "$0: about to dump raw egs."
  # Dump raw egs.
  steps/chaina/get_raw_egs.sh --cmd "$cmd" \
    --lang "default" \
    --left-context $egs_left_context \
    --right-context $egs_right_context \
    --frame-subsampling-factor $frame_subsampling_factor \
    --alignment-subsampling-factor $frame_subsampling_factor \
    --frames-per-chunk 150 \
    ${train_data_dir} ${dir} ${lat_dir} ${dir}/raw_egs
fi

if [ $stage -le 19 ] && [ -z $common_egs_dir ]; then
  echo "$0: about to process egs"
  steps/chaina/process_egs.sh  --cmd "$cmd" \
    --chunks-per-group ${chunks_per_group} ${dir}/raw_egs ${dir}/processed_egs
fi

if [ $stage -le 20 ] && [ -z $common_egs_dir ]; then
  echo "$0: about to randomize egs"
  steps/chaina/randomize_egs.sh --frames-per-job 3000000 \
    ${dir}/processed_egs ${dir}/egs
fi

if [ ! -z $common_egs_dir ]; then
  egs_dir=$common_egs_dir;
else
  egs_dir=$dir/egs
fi

if [ $stage -le 21 ]; then
  echo "$0: about to train model"
  steps/chaina/train.sh \
    --num-epochs 10.0 \
    --stage $train_stage --cmd "$cmd" \
    --xent-regularize $xent_regularize --leaky-hmm-coefficient 0.1 \
    --dropout-schedule "$dropout_schedule" \
    --num-jobs-initial 2 --num-jobs-final 4 \
     $egs_dir $dir

fi


if [ $stage -le 22 ]; then
  # Dump the bottom-nnet outputs for this data.
  test_sets=dev_clean_2
  for data in $test_sets; do
    steps/chaina/compute_embeddings.sh data/${data}_hires $dir/final $dir/data/final/${data}
  done
fi

if [ $stage -le 23 ]; then
  # Note: it's not important to give mkgraph.sh the lang directory with the
  # matched topology (since it gets the topology file from the model).
  utils/mkgraph.sh \
    --self-loop-scale 1.0 data/lang_test_tgsmall \
    $tree_dir $tree_dir/graph_tgsmall || exit 1;
fi

if [ $stage -le 24 ]; then
  # Do the speaker-independent decoding pass
  test_sets=dev_clean_2
  for data in $test_sets; do
    steps/chaina/decode_si.sh --cmd "$cmd" --nj 10 --num-threads 4 \
        data/${data}_hires $tree_dir/graph_tgsmall\
        $dir/final $dir/data/final/${data} \
        $dir/decode_${data}_tgsmall.si
  done
fi

if [ $stage -le 25 ]; then
  # Do the speaker-dependent decoding pass and LM rescoring
  test_sets=dev_clean_2
  for data in $test_sets; do
    steps/chaina/decode.sh --cmd "$cmd" --num-threads 4 \
      data/${data}_hires $tree_dir/graph_tgsmall\
      $dir/final $dir/data/final/${data} \
      $dir/decode_${data}_tgsmall.si $dir/decode_${data}_tgsmall

    steps/lmrescore_const_arpa.sh --cmd "$cmd" \
      data/lang_test_{tgsmall,tglarge} \
      data/${data}_hires $dir/decode_${data}_{tgsmall,tglarge}
  done
fi



exit 0;
