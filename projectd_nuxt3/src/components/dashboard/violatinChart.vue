<script lang="ts">
import { defineComponent, h, PropType } from 'vue'

import { Line } from 'vue-chartjs'
import {
  Chart as ChartJS,
  Title,
  Tooltip,
  Legend,
  LineElement,
  LinearScale,
  PointElement,
  CategoryScale,
  Plugin
} from 'chart.js'

ChartJS.register(
  Title,
  Tooltip,
  Legend,
  LineElement,
  LinearScale,
  PointElement,
  CategoryScale
)

export default defineComponent({
  name: 'LineChart',
  components: {
    Line
  },
  props: {
    chartData:{
      type: Object,
      default: null
    },
    chartId: {
      type: String,
      default: 'line-chart'
    },
    width: {
      type: Number,
      default: 400
    },
    height: {
      type: Number,
      default: 200
    },
    cssClasses: {
      default: '',
      type: String
    },
    styles: {
      type: Object as PropType<Partial<CSSStyleDeclaration>>,
      default: () => {}
    },
    plugins: {
      type: Array as PropType<Plugin<'line'>[]>,
      default: () => []
    }
  },
  setup(props) {
    const chartData = {
      labels: [ '7/1', '7/8', '7/15', '7/22', '7/29'],
      datasets: [
        {
          label: '〇〇〇駐輪場',
          backgroundColor: '#F39C12',
          borderColor: '#F39C12',
          data: [5, 1, 2, 3, 4]
        },
        {
          label: '△△△駐輪場',
          backgroundColor: '#27AE60',
          borderColor: '#27AE60',
          data: [2,4,1,2,5]
        },
        {
          label: '文教駐輪場',
          backgroundColor: '#3498DB',
          borderColor: '#3498DB',
          data: [0,2,3,1,0]
        }
      ]
    }

    const chartOptions = {
      responsive: true,
      maintainAspectRatio: false,
      plugins: {
        legend: {
          position: 'right',
          labels:{
            padding: 50
          }
        }
      },
      scales: {
         x: {
            title: {
               display: true,
               text: '時間'
            }
         },
         y: {
            min: 0
         }
      },
    }

    return () =>
      h(Line, {
        chartData,
        chartOptions,
        chartId: props.chartId,
        width: props.width,
        height: props.height,
        cssClasses: props.cssClasses,
        styles: props.styles,
        plugins: props.plugins
      })
  }
})

</script>