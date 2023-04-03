# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby31 ruby32"

inherit ruby-fakegem

DESCRIPTION="Send email in one command: Pony.mail(:to => 'someone@example.com', :body => 'hello')"
HOMEPAGE="http://github.com/benprew/pony"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/mail-2.0"

