<template>
  <div id="exam-list">
    <v-card flat tile>
      <v-card-title>
        试卷列表
        <v-spacer></v-spacer>
        <v-text-field
          v-model="search"
          append-icon="mdi-magnify"
          label="输入查询内容"
          single-line
          hide-details
        ></v-text-field>
      </v-card-title>
<!--      未答试卷-->
      <v-data-table :headers="headers" :items="table" :search="search">
        <!-- 操作 -->
        <template v-slot:item.action="slotScope">
          <router-link
            :to="{
              path: '/exam-paper/do/'+slotScope.item.id
            }"
          >
            <v-btn color="primary" small >开始答题</v-btn>
          </router-link>
<!--          <router-link-->
<!--                  :to="{-->
<!--              path: '/exam-paper/record/'+slotScope.item.id-->
<!--            }"-->
<!--                  v-show="hadDo(slotScope.item.id)"-->
<!--          >-->
<!--            <v-btn color="green" small >查看答题卡</v-btn>-->
<!--          </router-link>-->
        </template>
      </v-data-table>
    </v-card>
  </div>
</template>

<script>
  import TimeConverse from '@/utils/timeConverse'
  export default {
  name: "ExamList",
  data() {
    return {
      search: "",
      headers: [
        { text: "试卷名称", value: "name" },
        { text: "学科", value: "subjectName" },
        { text: "截止日期(Date)", value: "endTime" },
        { text: "操作", value: "action" },
      ],
      table: [],
      hadDoPaper:[]
    };
  },
  created() {
    this.searchList();
  },
  methods: {
    searchList() {
      let d = [];
      this.$api.PaperList().then((res) => {
        console.log(res);
        res.data.forEach((item, index) => {
          if(item.isPublish===true){//只展示发布了的试卷
            d.push({
              key: index,
              id:item.id,
              subjectName: item.Subject.name,
              name: item.name,
              endTime: TimeConverse.utcToLocal(item.endTime),
            });
          }
        });
        this.table = d;
      });
    },
  },
};
</script>

<style lang="scss"></style>
