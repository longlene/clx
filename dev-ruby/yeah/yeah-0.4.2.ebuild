# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Video game framework designed to be easy to learn and fast to build games with"
HOMEPAGE="https://github.com/yeahrb/yeah"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rake-10.3.1"
ruby_add_rdepend ">=dev-ruby/minitest-5.3.2"
ruby_add_rdepend ">=dev-ruby/opal-minitest-0.0.4"
ruby_add_rdepend ">=dev-ruby/yard-0.8.7.2"
ruby_add_rdepend ">=dev-ruby/kramdown-1.4.1"

