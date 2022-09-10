import type { Ref } from 'vue'

type loginUser = {
  token: string;
  user: User;
}

type User = {
  id: number;
  name: string;
  email: string;
  email_verified_at: string;
  created_at: string;
  updated_at: string;
}

const login = (state: Ref<loginUser>) =>  async (e: any) => {
  state.value = e
  useRouter().push('/')
}

const logout = (state: Ref<loginUser>) => async () => {
  state.value = null
  useRouter().push('/login')
}

export const useAuth = () => {
  const loginUser = useState<loginUser>('loginUser', () => null)
  return {
    loginUser,
    login: login(loginUser),
    logout: logout(loginUser),
  }
}