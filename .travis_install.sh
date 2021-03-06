export OPAMYES=true
export PACKAGE=bap
export TESTS=false

if [ "$WITH_BUILD_CACHE" == "true" ]; then
    export POST_INSTALL_HOOK='
rm -rf bap-veri
git clone https://github.com/BinaryAnalysisPlatform/bap-veri.git
opam pin add bap-veri bap-veri/ -y
OPAM_SWITCH=`opam config var switch`
mkdir -p $HOME/save_opam
mkdir -p $HOME/save_opam/lib
cp -r $HOME/.opam/$OPAM_SWITCH/bin/ $HOME/save_opam/
cp -r $HOME/.opam/$OPAM_SWITCH/share $HOME/save_opam/
opam remove bap-veri -y
cp -r $HOME/.opam/$OPAM_SWITCH/lib/bap* $HOME/save_opam/lib/
'
fi

bash -ex .travis-opam.sh
