# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Validations mixin for Ruby objects and support for Hanami"
HOMEPAGE="http://hanamirb.org"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/hanami-utils-0.9"
ruby_add_rdepend ">=dev-ruby/dry-validation-0.10"
ruby_add_rdepend ">=dev-ruby/bundler-1.6"
ruby_add_rdepend ">=dev-ruby/minitest-5"
ruby_add_rdepend ">=dev-ruby/rake-10"

