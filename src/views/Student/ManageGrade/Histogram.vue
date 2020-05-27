<template>
    <div id="histogram">
        <v-card class="pa-5">
            用户排名
            <v-chart class="my-chart" :options="histogram"
                     style="width: 100%;"
                     :auto-resize="true"
                     ref="chart"
            />
        </v-card>
    </div>
</template>

<script>
    export default {
        data(){
            return{
                histogram:{
                    title: {
                        text: "ECharts 入门示例"
                    },
                    color: ['#01579B'],
                    tooltip: {},
                    legend: {
                        data: ["销量"]
                    },
                    xAxis: {
                        data: ["cyy", "lxy", "mona","cyy", "lxy", "mona"]//用户
                    },
                    yAxis: {},
                    series: [
                        {
                            name: "销量",
                            type: "bar",
                            data: [5, 20, 20, 10, 10, 20]//考试分数
                        }
                    ]
                }
            }
        },
        created(){
            this.$nextTick(() => {
                this.$refs.chart.resize();
            })
        },
        methods: {

        }
    };
</script>

<style lang="scss" scoped>
    #histogram {
        margin-bottom: 5px;
        .my-chart {
            margin: 0 auto;
        }
    }
</style>