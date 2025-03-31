import { render, screen } from '@testing-library/react';
import App from './App';

test('renders hospital header', () => {
  render(<App />);
  const titleElement = screen.getByText(/Hospital/i);
  expect(titleElement).toBeInTheDocument();
});
