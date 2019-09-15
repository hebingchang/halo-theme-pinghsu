
var myChart = echarts.init(document.getElementById('contributions'));

COLORS = ['#edeff2', '#c6e48b', '#7bc96f', '#239a3b', '#196127'];
var today = new Date();
var count = 0;

var app = new Vue({
  el: '#app',
  data: {
    repos: []
  },
  mounted () {
    axios.get('https://github-contributions-api.now.sh/v1/hebingchang')
    .then((response) => {
        var contributions = response.data.contributions.reverse();
        var data = [];

        start_index = contributions.findIndex((day) => {
        return day.date === [today.getFullYear() - 1, (today.getMonth() + 1).toString().padStart(2, '0'), (today.getDate() + 1).toString().padStart(2, '0')].join('-');
        });
        if (start_index === -1) start_index = 0;

        end_index = contributions.findIndex((day) => {
        return day.date === [today.getFullYear(), (today.getMonth() + 1).toString().padStart(2, '0'), today.getDate().toString().padStart(2, '0')].join('-');
        });

        max_count = Math.max.apply(Math, contributions.slice(start_index, end_index + 1).map(function(o) { return o.count; }));
        console.log(max_count);

        for (var day of contributions.slice(start_index, end_index + 1)) {
        var color = COLORS[day.intensity];
        data.push({
            name: day.date,
            value: [parseInt(count / 7), (6 - count % 7), day.count],
            itemStyle: { color: color }
        });
        count++;
        }

        option = {
        tooltip: {},
        xAxis3D: {
            type: 'category',
            data: [...Array(53).keys()]
        },
        yAxis3D: {
            type: 'category',
            data: [...Array(7).keys()]
        },
        zAxis3D: {
            type: 'value'
        },
        grid3D: {
            show: false,
            boxWidth: 600,
            boxDepth: 80,
            light: {
            main: {
                intensity: 1.2,
                shadow: true
            },
            ambient: {
                intensity: 0.3
            }
            },
            viewControl: {
            projection: 'orthographic',
            orthographicSize: 300,
            beta: 40,
            alpha: 30
            }
        },
        series: [{
            type: 'bar3D',
            data: data,
            shading: 'realistic',
            // bevelSize: 0.3,
            label: {
            show: false,
            },
            tooltip: {
                formatter: function (params, ticket, callback) {
                    return `<span style="color: #fff; font-weight: 500;">${params.value[2]} commits</span> <span style="color: #ccc">on ${params.name}</span>`;
                }
            }
        }]
        };

        myChart.setOption(option);
    })
    .catch(function (error) {
        console.log(error);
    });
  },
  created () {
    axios.get('https://api.github.com/users/hebingchang/repos')
    .then((response) => {
        this.repos = response.data.filter(repo => !repo.fork && repo.stargazers_count).sort(function(a, b) {
            return b.stargazers_count - a.stargazers_count;
        });
    })
    .catch(function (error) {
        console.log(error);
    })
  }
})