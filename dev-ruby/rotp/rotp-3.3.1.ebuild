# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby22 ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Works for both HOTP and TOTP, and includes QR Code provisioning"
HOMEPAGE="http://github.com/mdp/rotp"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rake-10.5"
ruby_add_rdepend ">=dev-ruby/rspec-3.5"
ruby_add_rdepend ">=dev-ruby/timecop-0.8"
ruby_add_rdepend ">=dev-ruby/simplecov-0.12"

