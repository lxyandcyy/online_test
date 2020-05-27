<template>
    <div id="pie">
        <v-card class="pa-5">
            及格率
            <v-chart class="my-chart" :options="pie"/>
        </v-card>
    </div>
</template>

<script>
    export default {
        data(){
            return{
                pie: {
                    color: ['#90CAF9', '#EF9A9A'],
                    series : [
                        {
                            type:'pie',
                            // 数据
                            data:[
                                {value:5, name:'及格'},
                                {value:4, name:'不及格'},
                            ]
                        }
                    ]
                }
            }
        },
        mounted(){
        },
        methods: {

        }
    };
</script>

<style lang="scss" scoped>
    #pie{
        margin-bottom: 5px;
        .my-chart {
           margin: 0 auto;
        }
    }


</style>
