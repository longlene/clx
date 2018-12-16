# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Mobi is a Rubygem that allows you to easily read MOBI e-book format metadata"
HOMEPAGE="http://github.com/jkongie/mobi"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rspec-2.14.0"
ruby_add_rdepend ">=dev-ruby/rr-1.0.4"
ruby_add_rdepend ">=dev-ruby/bundler-1.3.0"
ruby_add_rdepend ">=dev-ruby/jeweler-1.8.0"

