# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="It adds support for send invitations by email (it requires to be authenticated) and accept the invitation by setting a password"
HOMEPAGE="https://github.com/scambra/devise_invitable"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/bundler-1.1.0"
ruby_add_rdepend ">=dev-ruby/actionmailer-4.1.0"
ruby_add_rdepend ">=dev-ruby/devise-4.0.0"

