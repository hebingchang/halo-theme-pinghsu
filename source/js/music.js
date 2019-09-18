let player = document.getElementById('aplayer')
let songid = player.dataset.songid

if (player !== null) {
  axios.get('https://api.netease.boar.ac.cn/song/detail?ids=' + songid)
    .then((res_detail) => {
      axios.get('https://api.netease.boar.ac.cn/song/url?id=' + songid)
        .then((res_url) => {
          axios.get('https://api.netease.boar.ac.cn/lyric?id=' + songid)
            .then((res_lyric) => {
              const ap = new APlayer({
                container: document.getElementById('aplayer'),
                audio: [
                  {
                    name: res_detail.data.songs[0].name,
                    artist: res_detail.data.songs[0].ar[0].name,
                    url: res_url.data.data[0].url,
                    cover: res_detail.data.songs[0].al.picUrl,
                    lrc: res_lyric.data.lrc.lyric,
                  }
                ]
              });
            })
            .catch(function (error) {
              console.log(error);
            })
        })
        .catch(function (error) {
          console.log(error);
        })
    })
    .catch(function (error) {
      console.log(error);
    })
}

