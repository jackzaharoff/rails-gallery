require 'spec_helper'

describe 'routing to root' do
  it 'routes to root' do
    expect(get: '/').to route_to(
        controller: 'home',
        action: 'index'
    )
  end
end

describe 'routing to about' do
  it 'routes to about page' do
    expect(get: '/about').to route_to(
        controller: 'home',
        action: 'about'
    )
  end
end

describe 'routing to contact' do
  it 'routes to contact page' do
    expect(get: '/contact').to route_to(
        controller: 'home',
        action: 'contact'
    )
  end
end