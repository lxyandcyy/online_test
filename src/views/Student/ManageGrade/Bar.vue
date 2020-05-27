<template>
    <div id="bar">
        <v-card class="pa-5">

            <v-chart class="my-chart" :options="bar"
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
           bar: {
               title: {
                   text: "ECharts 入门示例"
               },
               color:['#FB8C00'],
               tooltip: {},
               legend: {
                   data: ["销量"]
               },
               xAxis: {
                   data: ["最高分", "平均分", "最低分"]
               },
               yAxis: {},
               series: [
                   {
                       name: "销量",
                       type: "bar",
                       data: [5, 20, 20, 10, 10, 20]
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
    #bar{
        margin-bottom: 5px;
        .my-chart {
            margin: 0 auto;
        }
    }
</style>