# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Identify email addresses or domains names that belong to colleges or universities"
HOMEPAGE="https://github.com/leereilly/swot"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/public_suffix-0"
ruby_add_rdepend ">=dev-ruby/naughty_or_nice-2.0"
ruby_add_rdepend ">=dev-ruby/nokogiri-1.5"
ruby_add_rdepend ">=dev-ruby/rake-10.0"
ruby_add_rdepend ">=dev-ruby/rdoc-3.12"
ruby_add_rdepend ">=dev-ruby/bundler-1.5"
ruby_add_rdepend ">=dev-ruby/jeweler-1.8"
ruby_add_rdepend ">=dev-ruby/minitest-4.7.5"

