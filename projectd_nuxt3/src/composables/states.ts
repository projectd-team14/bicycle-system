export const useArticleTitle = () => {
   const title = useState('title', () => null)
   return { title }
}

export const useSpots = () => {
   const spots = useState('spots', () => null)
   return { spots }
}

export const useDash = () => {
   const dash = useState('dash', () => null)
   return { dash }
}