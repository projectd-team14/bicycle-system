export const useArticleTitle = () => {
   const title = useState('title', () => null)
   return { title }
}

export const useSpots = () => {
   const spots = useState('spots', () => null)
   return { spots }
}