import { configureStore, Action, ThunkAction } from "@reduxjs/toolkit";
import auth from "../features/auth/authSlice";
import employees from "../features/employees/employeesSlice";
import { api } from "./services/api";
import { listenerMiddleware } from "../middleware/auth";

export const store = configureStore({
  reducer: {
    [api.reducerPath]: api.reducer,
    auth,
    employees,
  },
  middleware: (getDefaultMiddleware) =>
    getDefaultMiddleware()
      .concat(api.middleware)
      .prepend(listenerMiddleware.middleware),
});

export type RootState = ReturnType<typeof store.getState>;
export type AppDispatch = typeof store.dispatch;
export type AppThunk<ReturnType = void> = ThunkAction<
  ReturnType,
  RootState,
  unknown,
  Action<string>
>;
